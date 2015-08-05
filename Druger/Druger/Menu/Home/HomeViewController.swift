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
        drug_Label.text = "\(GlobalConst.showNumbers(me.DRUG))"
        //更新金钱信息
        money_Label.text = "\(GlobalConst.showNumbers(me.MONEY))"
    }
    
    @IBAction func makeDrug(sender: AnyObject) {
        me.DRUG = me.DRUG + 1
        drug_Label.text = "\(GlobalConst.showNumbers(me.DRUG))"
        me.update()
    }
    
    @IBAction func sellDrug(sender: AnyObject) {
        if (me.DRUG > 0){
            me.DRUG = me.DRUG - 1
            me.MONEY = me.MONEY + me.DRUG_PRICE
            drug_Label.text = "\(GlobalConst.showNumbers(me.DRUG))"
            money_Label.text = "\(GlobalConst.showNumbers(me.MONEY))"
            me.update()
        }
    }
    
    
    


}
