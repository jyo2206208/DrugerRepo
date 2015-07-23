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
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        headerLabel.text = "金钱：\(me.MONEY)"
    }
}

extension DrugFactoryViewController:UITableViewDelegate{
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(WorkerViewController(nibName: "WorkerViewController", bundle: nil), animated: true)
    }
}

extension DrugFactoryViewController:UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DRUG_FACTORY.numberElement()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell : DrugFactoryTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIDForDrugFactory, forIndexPath: indexPath) as! DrugFactoryTableViewCell
        cell.factory = DRUG_FACTORY(id: indexPath.row + 1)
        cell.delegate = self
        cell.name_label.text = DRUG_FACTORY(id: indexPath.row + 1).NAME
        cell.count_label.text = String(DRUG_FACTORY(id: indexPath.row + 1).COUNT)
        cell.describe_label.text = DRUG_FACTORY(id: indexPath.row + 1).DESCRIBE
        cell.price_label.text = String(DRUG_FACTORY(id: indexPath.row + 1).PRICE)
        return cell;
    }
}
