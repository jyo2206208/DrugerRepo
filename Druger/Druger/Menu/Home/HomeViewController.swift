//
//  HomeViewController.swift
//  Druger
//
//  Created by 杜晔 on 15/7/10.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var money_Label: UILabel!
    @IBOutlet weak var drug_Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        me.MONEY = 999999999
//        me.update()
        println(Int.max)
        

        
//        me.DRUG_MAKE_SPEED = 1
//        me.update()
        
        //设置全局的一个定时器每0.5秒刷新用户信息
        NSTimer.scheduledTimerWithTimeInterval(0.5, target:self, selector:"updateUIInfo", userInfo:nil, repeats:true)
    }
    
    override func viewDidAppear(animated: Bool) {
        //页面刚开始的时候显示的数据
        money_Label.text = String(stringInterpolationSegment: me.MONEY)
        drug_Label.text = String(stringInterpolationSegment: me.DRUG)
    }
    
    //根据用户的制毒速度实时更新用户的毒品数量信息
    func updateUIInfo(){
        var drug_count : Int64 = (drug_Label.text?.toInt())! + 1//这里需要改成+制毒速度
        drug_Label.text = String(drug_count)
        me.DRUG = drug_count
        me.update()
    }
    
    @IBAction func makeDrug(sender: AnyObject) {
        var drug_count : Int64 = (drug_Label.text?.toInt())! + 1
        drug_Label.text = String(drug_count)
        me.DRUG = drug_count
        me.update()
        
    }
    
    @IBAction func sellDrug(sender: AnyObject) {
        if ((drug_Label.text?.toInt())! > 0){
            var drug_count : Int64 = Int64((drug_Label.text?.toInt())!) - 1
            var money_count : Int64 = (money_Label.text?.toInt())! + me.DRUG_PRICE
            drug_Label.text = String(drug_count)
            money_Label.text = String(money_count)
            me.DRUG = drug_count
            me.MONEY = money_count
            me.update()
        }
    }
    
    

}
