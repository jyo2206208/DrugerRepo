//
//  WorkerViewController.swift
//  Druger
//
//  Created by 杜晔 on 15/7/17.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

import UIKit

class WorkerViewController: BaseViewController {
    @IBOutlet weak var money_label: UILabel!
    @IBOutlet weak var count_label: UILabel!
    @IBOutlet weak var price_label: UILabel!
    @IBOutlet weak var speed_label: UILabel!

    @IBAction func buyOne(sender: AnyObject) {
    }
    
    @IBAction func buyAll(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
