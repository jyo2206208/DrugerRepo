//
//  BaseViewController.swift
//  Druger
//
//  Created by 杜晔 on 15/7/10.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置全局的一个定时器每1秒刷新用户信息
//        NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector:"updateUIInfo", userInfo:nil, repeats:true)
        //设置全局不被遮挡（不设这个所有的viewcontroller都会被tabbar挡住）
        self.edgesForExtendedLayout = UIRectEdge.None
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showFormatNumbers(number:Float) -> String{
        var returnStr:String = "\(number)"
        if (number > 10000000000000){
            returnStr = "\(number / 1000000000000)兆"
        } else if (number > 1000000000){
            returnStr = "\(number / 100000000)亿"
        } else if (number > 100000) {
            returnStr = "\(number / 10000)万"
        } else {
            
        }
        
        
        return returnStr
    }

}
