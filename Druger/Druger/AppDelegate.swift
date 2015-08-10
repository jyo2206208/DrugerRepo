//
//  AppDelegate.swift
//  Druger
//
//  Created by 杜晔 on 15/7/10.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var globalTimer:NSTimer?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //初始化数据库
        GlobalConst.initDB()
        //初始化全局计时器
        if (globalTimer == nil){
            globalTimer =  NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector:"updateDBinfo", userInfo:nil, repeats:true)
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        //当程序状态从active变化时暂停定时器，更新用户信息
        globalTimer?.fireDate = NSDate.distantFuture() as! NSDate
        me.update()
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        //当程序状态从其他变化为active时继续开启定时器。
        globalTimer?.fireDate = NSDate.distantPast() as! NSDate
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //全局的用于更新用户数据的方法
    func updateDBinfo(){
        var currentDrug = me.DRUG
        //单位时间的毒品销售量
        var sellSpeed = getDrugSellSpeed()
        //单位时间的毒品产量
        var drugMakeSpeed = getDrugMakeSpeed()
        var leftDrug = currentDrug + drugMakeSpeed - sellSpeed
        
        if (leftDrug >= 0){//如果增速不至于把当前毒品量清空的话
            me.DRUG = leftDrug
            me.MONEY = me.MONEY + Float(sellSpeed) * me.DRUG_PRICE
        } else {//如果增速把当前毒品量清空的话
            me.DRUG = 0
            me.MONEY = me.MONEY + Float(currentDrug) * me.DRUG_PRICE + Float(drugMakeSpeed) * me.DRUG_PRICE
        }
        //经销商雇佣
        me.SALES_COUNT = me.SALES_COUNT + me.BUSINESSMAN_COUNT * me.BUSINESSMAN_SPEED
    }
    
    //获取当前的制毒速度
    func getDrugMakeSpeed () -> Float{
        var speed:Float = 0
        for currentElement in DRUG_FACTORY.select(selectRequest: .SelectAll(.Ascending, ""))! {
            var element : DRUG_FACTORY = currentElement as! DRUG_FACTORY
            speed = speed + Float(element.WORKER_COUNT * element.WORKER_SPEED)
        }
        return speed
    }
    
    //获取当前的销售速度
    func getDrugSellSpeed () -> Float{
        var speed:Float = 0
        speed = Float(me.SALES_COUNT * me.SALES_SPEED)
        return speed
    }

}

