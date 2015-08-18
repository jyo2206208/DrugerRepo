//
//  DrugFactoryTableViewCell.swift
//  Druger
//
//  Created by 杜晔 on 15/7/17.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class DrugFactoryTableViewCell: UITableViewCell {
    var delegate : DrugFactoryViewController!
    var factory : DRUG_FACTORY!
    
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var count_label: UILabel!
    @IBOutlet weak var describe_label: UILabel!
    @IBOutlet weak var price_label: UILabel!

    @IBAction func buy(sender: AnyObject) {
        if (me.MONEY >= factory.PRICE){
            me.MONEY = me.MONEY - factory.PRICE
            factory.COUNT++
            factory.update()
            GlobalConst.initFactorys()
            count_label.text = String(factory.COUNT)
            delegate.updateUIInfo()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
