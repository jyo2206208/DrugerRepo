//
//  WorkerViewController.swift
//  Druger
//
//  Created by 杜晔 on 15/7/17.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class WorkerViewController: BaseViewController {
    var factory:DRUG_FACTORY!
    
    @IBOutlet weak var money_label: UILabel!
    @IBOutlet weak var count_label: UILabel!
    @IBOutlet weak var price_label: UILabel!
    @IBOutlet weak var speed_label: UILabel!

    @IBAction func buyOne(sender: AnyObject) {
        var currentWorkerCount:Int64 = factory.WORKER_COUNT
        var maxCount:Int64 = factory.COUNT * factory.WORKER_MAX
        var moneyAfterCost:Float = me.MONEY - factory.WORKER_PRICE
        if(moneyAfterCost >= 0 && currentWorkerCount < maxCount){
            factory.WORKER_COUNT = currentWorkerCount + 1
            factory.update()
            GlobalConst.initFactorys()
            me.MONEY = moneyAfterCost
        }
        updateUIInfo()
    }
    
    @IBAction func buyAll(sender: AnyObject) {
        var currentWorkerCount:Int64 = factory.WORKER_COUNT
        var maxCount:Int64 = factory.COUNT * factory.WORKER_MAX
        var moneyAfterCost:Float = me.MONEY - Float((maxCount - currentWorkerCount)) * factory.WORKER_PRICE
        if(moneyAfterCost >= 0 && currentWorkerCount < maxCount){
            factory.WORKER_COUNT = maxCount
            factory.update()
            GlobalConst.initFactorys()
            me.MONEY = moneyAfterCost
        }
        updateUIInfo()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIInfo()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUIInfo", name: "updateUINotification", object: nil)
        price_label.text = "\(showFormatNumbers(factory.WORKER_PRICE))"
        speed_label.text = "\(factory.WORKER_SPEED)"
        // Do any additional setup after loading the view.
    }

    func addWorkers(count:Int64){
        var currentWorkerCount:Int64 = factory.WORKER_COUNT
        var workerCount:Int64
        var maxCount:Int64 = factory.COUNT * factory.WORKER_MAX
        if (count == 0){
            workerCount = maxCount - currentWorkerCount
        } else {
            workerCount = count
        }
        
        var moneyAfterCost:Float = me.MONEY - Float(workerCount) * factory.WORKER_PRICE
        if(moneyAfterCost >= 0 && currentWorkerCount < maxCount){
            factory.WORKER_COUNT = currentWorkerCount + workerCount
            factory.update()
            me.MONEY = moneyAfterCost
        }
        updateUIInfo()
    }
    
    //来自父类的UI情报更新方法。每0.5s更新一次!必须实现!!!
    func updateUIInfo(){
        money_label.text = "\(showFormatNumbers(me.MONEY))"
        count_label.text = "\(factory.WORKER_COUNT)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
