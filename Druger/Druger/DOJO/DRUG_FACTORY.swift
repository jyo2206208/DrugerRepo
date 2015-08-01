//
//  DRUG_FACTORY.swift
//  Druger
//
//  Created by 杜晔 on 15/7/15.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

class DRUG_FACTORY: CamembertModel {
    //名字
    var NAME:TEXT = ""
    //价格
    var PRICE:INTEGER = 0
    //数量
    var COUNT:INTEGER = 0
    //是否可以被显示
    var ISVALID:BIT = false
    //制毒人员
    var WORKER_NAME:TEXT = ""
    //制度人员价格
    var WORKER_PRICE:INTEGER = 0
    //制毒人员制毒速度
    var WORKER_SPEED:INTEGER = 0
    //制毒人员人数
    var WORKER_COUNT:INTEGER = 0
    //一个工厂可容纳制毒人员人数
    var WORKER_MAX:INTEGER = 0
    //工厂说明
    var DESCRIBE:TEXT = ""

    override init(id:Int){
        super.init(id: id)
    }
    
    override init(){
        super.init()
    }
    
    init(id:Int, NAME:String, PRICE:Int64, WORKER_NAME:String, WORKER_PRICE:Int64, WORKER_SPEED:Int64, WORKER_MAX:Int64, DESCRIBE:TEXT) {
        super.init(id: id)
        self.NAME = NAME
        self.PRICE = PRICE
        self.WORKER_NAME = WORKER_NAME
        self.WORKER_PRICE = WORKER_PRICE
        self.WORKER_SPEED = WORKER_SPEED
        self.WORKER_MAX = WORKER_MAX
        self.DESCRIBE = DESCRIBE
        self.push()
        self.update()
    }
    
}
