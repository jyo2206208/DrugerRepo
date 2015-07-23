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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //初始化数据库
        self.initMyDataBase()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func initMyDataBase(){
        Camembert.initDataBase("db.sqlite")
        //初始化用户信息
        USER(id:1).push()
        //初始化制毒工厂信息
        DRUG_FACTORY(id: 1, NAME: "房车", PRICE: 2000, WORKER_NAME: "制毒的瘾君子", WORKER_PRICE:500, WORKER_SPEED: 1, WORKER_MAX: 5, DESCRIBE: "可雇佣5个制毒的瘾君子的房车，简陋又没效率，但是聊胜于无。")
        DRUG_FACTORY(id: 1, NAME: "房子", PRICE: 100000, WORKER_NAME: "化学系学生", WORKER_PRICE:5000, WORKER_SPEED: 5, WORKER_MAX: 10, DESCRIBE: "学生妹清纯可爱又能干，真的不错哟。")
    }

}

