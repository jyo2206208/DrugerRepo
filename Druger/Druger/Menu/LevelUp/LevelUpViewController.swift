//
//  LevelUpViewController.swift
//  Druger
//
//  Created by 杜晔 on 15/7/10.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class LevelUpViewController: BaseViewController {
    
    var drugFactoryViewController:DrugFactoryViewController!
    var salesHomeViewController:SalesHomeViewController!
    
    var levelTypes = ["制毒提升","贩毒提升"]

    @IBOutlet weak var levelTypesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //先注册CELLID
        levelTypesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        // Do any additional setup after loading the view.
    }
    
    func updateUIInfo(){
    }
}

extension LevelUpViewController:UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelTypes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = levelTypes[indexPath.row]
        return cell;
    }
}

extension LevelUpViewController:UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(drugFactoryViewController, animated: true)
        case 1:
            self.navigationController?.pushViewController(salesHomeViewController, animated: true)
        default:
            "default"
        }
        
    }
}
