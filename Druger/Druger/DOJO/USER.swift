//
//  USER.swift
//  Druger
//
//  Created by 杜晔 on 15/7/13.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

class USER: CamembertModel {
    //金钱
    var MONEY:INTEGER = 0
    //毒品数
    var DRUG:INTEGER = 0
    //毒品价格
    var DRUG_PRICE:INTEGER = 20
    //经销商数量
    var SALES_COUNT:INTEGER = 0
    //经销商贩毒速度(单人)
    var SALES_SPEED:INTEGER = 1
    //经销商价格
    var SALES_PRICE:INTEGER = 5000
    //大商人数量
    var BUSINESSMAN_COUNT:INTEGER = 0
    //大商人招募速度(单人)
    var BUSINESSMAN_SPEED:INTEGER = 1
    //大商人价格
    var BUSINESSMAN_PRICE:INTEGER = 1500000
}
