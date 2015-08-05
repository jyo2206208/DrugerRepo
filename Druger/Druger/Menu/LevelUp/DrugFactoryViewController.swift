//
//  DrugFactoryViewController.swift
//  Druger
//
//  Created by 杜晔 on 15/7/13.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class DrugFactoryViewController: BaseViewController {
    var headerLabel : UILabel = UILabel(frame:CGRect(x: 0, y: 0, width: 1, height: 40))
    @IBOutlet weak var drugFactoryTable: UITableView!

    override func viewDidLoad() {
        self.navigationItem.title = "制毒工厂"
        super.viewDidLoad()
        var nib = UINib(nibName: "DrugFactoryTableViewCell", bundle: nil)
        drugFactoryTable.registerNib(UINib(nibName: "DrugFactoryTableViewCell", bundle: nil), forCellReuseIdentifier: cellIDForDrugFactory)
        drugFactoryTable.tableHeaderView = headerLabel
        updateUIInfo()
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        headerLabel.text = "金钱：\(me.MONEY)"
//    }
    
    //来自父类的UI情报更新方法。每0.5s更新一次!必须实现!!!
    func updateUIInfo(){
        headerLabel.text = "金钱：\(GlobalConst.showNumbers(me.MONEY))"
    }
}

extension DrugFactoryViewController:UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var workerViewController:WorkerViewController = WorkerViewController(nibName: "WorkerViewController", bundle: nil)
        workerViewController.factory = DRUG_FACTORY(id: indexPath.row + 1)
        self.navigationController?.pushViewController(workerViewController, animated: true)
    }
}

extension DrugFactoryViewController:UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DRUG_FACTORY.numberElement()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell : DrugFactoryTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIDForDrugFactory, forIndexPath: indexPath) as! DrugFactoryTableViewCell
        var factory = DRUG_FACTORY(id: indexPath.row + 1)
        cell.factory = factory
        cell.delegate = self
        cell.name_label.text = factory.NAME
        cell.count_label.text = "\(factory.COUNT)"
        cell.describe_label.text = factory.DESCRIBE
        cell.price_label.text = "\(GlobalConst.showNumbers(factory.PRICE))"
        return cell;
    }
}
