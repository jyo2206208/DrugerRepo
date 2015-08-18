//
//  SalesHomeViewController.swift
//  Druger
//
//  Created by 杜晔 on 15/7/28.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class SalesHomeViewController: BaseViewController {
    @IBOutlet weak var money_label: UILabel!
    @IBOutlet weak var sale_label: UILabel!
    @IBOutlet weak var saleHireSpeed_label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIInfo()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUIInfo", name: "updateUINotification", object: nil)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hireOneSalesMan(sender: AnyObject) {
        if(me.MONEY >= me.SALES_PRICE){
            me.MONEY = me.MONEY - me.SALES_PRICE
            me.SALES_COUNT = me.SALES_COUNT + 1
            updateUIInfo()
        }
    }
    
    @IBAction func HireOneBusinessMan(sender: AnyObject) {
        if(me.MONEY >= me.BUSINESSMAN_PRICE){
            me.MONEY = me.MONEY - me.BUSINESSMAN_PRICE
            me.BUSINESSMAN_COUNT = me.BUSINESSMAN_COUNT + 1
            updateUIInfo()
        }
    }

    @IBAction func HireAllBusinessMan(sender: AnyObject) {
        var count = Int(me.MONEY / me.BUSINESSMAN_PRICE)
        if (count > 0){
            me.MONEY = me.MONEY - me.BUSINESSMAN_PRICE * Float(count)
            me.BUSINESSMAN_COUNT = me.BUSINESSMAN_COUNT + count
            updateUIInfo()
        }
        
    }
    func updateUIInfo(){
        money_label.text = "\(showFormatNumbers(me.MONEY))"
        sale_label.text = "\(me.SALES_COUNT)"
        saleHireSpeed_label.text = "\(me.BUSINESSMAN_COUNT * me.BUSINESSMAN_SPEED)"
    }
}
