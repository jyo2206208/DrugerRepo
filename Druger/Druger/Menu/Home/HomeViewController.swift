//
//  HomeViewController.swift
//  Druger
//
//  Created by 杜晔 on 15/7/10.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var drugLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        me.MONEY = 999999999
        //        me.update()
        updateUIInfo()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUIInfo", name: "updateUINotification", object: nil)
    }
    
    //根据用户的制毒速度更新用户的毒品数量信息
    func updateUIInfo(){
        //更新毒品信息
        drugLabel.text = "\(showFormatNumbers(me.DRUG))"
        //更新金钱信息
        moneyLabel.text = "\(showFormatNumbers(me.MONEY))"
    }
    
    @IBAction func makeDrug(sender: AnyObject) {
        me.DRUG = me.DRUG + 1
        drugLabel.text = "\(showFormatNumbers(me.DRUG))"
    }
    
    @IBAction func sellDrug(sender: AnyObject) {
        if (me.DRUG > 0){
            me.DRUG = me.DRUG - 1
            me.MONEY = me.MONEY + me.DRUG_PRICE
            drugLabel.text = "\(showFormatNumbers(me.DRUG))"
            moneyLabel.text = "\(showFormatNumbers(me.MONEY))"
        }
    }
}
