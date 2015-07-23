//
//  GlobalConst.swift
//  Druger
//
//  Created by 杜晔 on 15/7/13.
//  Copyright (c) 2015年 杜闵. All rights reserved.
//

//定义全系统都可用的常量的地方

//初始化用户数据
var me : USER = USER(id:1)

//通用的默认cellID
let cellID : String = "CELLID"
//制毒工厂页面的cellID
let cellIDForDrugFactory : String = "CEllIDFORDRUGFACTORY"



class GlobalConst: NSObject {

    class func initDB() {
        Camembert.initDataBase("db.sqlite")
        //初始化用户信息
        USER(id:1).push()
        //========================初始化制毒工厂信息========================
        DRUG_FACTORY(
            id: 1,
            NAME: "房车",
            PRICE: 2000,
            WORKER_NAME: "制毒的瘾君子",
            WORKER_PRICE:500,
            WORKER_SPEED: 1,
            WORKER_MAX: 5,
            DESCRIBE: "可雇佣5个制毒的瘾君子的房车，简陋又没效率，但是聊胜于无。"
        )
        DRUG_FACTORY(
            id: 2,
            NAME: "房子",
            PRICE: 100000,
            WORKER_NAME: "化学系学生",
            WORKER_PRICE:5000,
            WORKER_SPEED: 5,
            WORKER_MAX: 10,
            DESCRIBE: "学生妹清纯可爱又能干，真的不错哟。"
        )
        //========================初始化制毒工厂信息========================
        
        
        //========================初始化销售团队信息========================
        //========================初始化销售团队信息========================
        
        
        //========================初始化成就信息========================
        //========================初始化成就信息========================
        
    }
    
    
}
