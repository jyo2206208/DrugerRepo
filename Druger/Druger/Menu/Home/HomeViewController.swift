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
        updateUIInfo()
        
    }
    
    //根据用户的制毒速度实时更新用户的毒品数量信息
    //来自父类的UI情报更新方法。每0.5s更新一次!必须实现!!!
    func updateUIInfo(){
        //更新毒品信息
        drug_Label.text = "\(me.DRUG)"
        //更新金钱信息
        money_Label.text = "\(me.MONEY)"
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
