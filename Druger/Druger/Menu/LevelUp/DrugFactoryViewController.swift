//
//  DrugFactoryViewController.swift
//  Druger
//
//  Created by 杜晔 on 15/7/13.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class DrugFactoryViewController: BaseViewController {
    var workerViewController:WorkerViewController!
    var headerLabel : UILabel = UILabel(frame:CGRect(x: 0, y: 0, width: 1, height: 40))
    @IBOutlet weak var drugFactoryTable: UITableView!

    override func viewDidLoad() {
        self.navigationItem.title = "制毒工厂"
        super.viewDidLoad()
        var nib = UINib(nibName: "DrugFactoryTableViewCell", bundle: nil)
        drugFactoryTable.registerNib(UINib(nibName: "DrugFactoryTableViewCell", bundle: nil), forCellReuseIdentifier: cellIDForDrugFactory)
        drugFactoryTable.tableHeaderView = headerLabel
        updateUIInfo()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUIInfo", name: "updateUINotification", object: nil)
        // Do any additional setup after loading the view.
    }
    
    //来自父类的UI情报更新方法。每0.5s更新一次!必须实现!!!
    func updateUIInfo(){
        headerLabel.text = "金钱：\(showFormatNumbers(me.MONEY))"
    }
}

extension DrugFactoryViewController:UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        workerViewController.factory = factorys[indexPath.row]
        self.navigationController?.pushViewController(workerViewController, animated: true)
    }
}

extension DrugFactoryViewController:UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factorys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell : DrugFactoryTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIDForDrugFactory, forIndexPath: indexPath) as! DrugFactoryTableViewCell
        var factory = factorys[indexPath.row]
        cell.factory = factory
        cell.delegate = self
        cell.name_label.text = factory.NAME
        cell.count_label.text = "\(factory.COUNT)"
        cell.describe_label.text = factory.DESCRIBE
        cell.price_label.text = "\(showFormatNumbers(factory.PRICE))"
        return cell;
    }
}
