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
            DESCRIBE: "可雇佣5个制毒的瘾君子的房车。简陋又没效率，但是聊胜于无。"
        )
        DRUG_FACTORY(
            id: 2,
            NAME: "房子",
            PRICE: 100000,
            WORKER_NAME: "化学系学生",
            WORKER_PRICE:5000,
            WORKER_SPEED: 5,
            WORKER_MAX: 10,
            DESCRIBE: "可雇佣10个化学系学生。学生妹清纯可爱又能干，真的不错哟。"
        )
        DRUG_FACTORY(
            id: 3,
            NAME: "设施",
            PRICE: 1000000,
            WORKER_NAME: "化学家",
            WORKER_PRICE:50000,
            WORKER_SPEED: 15,
            WORKER_MAX: 30,
            DESCRIBE: "可雇佣30个化学家。化学总是那么令人着迷。"
        )
        DRUG_FACTORY(
            id: 4,
            NAME: "岛屿",
            PRICE: 30000000,
            WORKER_NAME: "部落里的制毒者",
            WORKER_PRICE:50000,
            WORKER_SPEED: 80,
            WORKER_MAX: 40,
            DESCRIBE: "可雇佣40个部落里的制毒者。你好毒你好毒你好毒毒毒毒毒~~~"
        )
        DRUG_FACTORY(
            id: 5,
            NAME: "隐秘处",
            PRICE: 100000000,
            WORKER_NAME: "忠诚的工作者",
            WORKER_PRICE:90000,
            WORKER_SPEED: 150,
            WORKER_MAX: 45,
            DESCRIBE: "可雇佣45个忠诚的工作者。为了主人，献出自己的心脏。"
        )
        DRUG_FACTORY(
            id: 6,
            NAME: "棒子国",
            PRICE: 2000000000,
            WORKER_NAME: "棒子*500",
            WORKER_PRICE:500000,
            WORKER_SPEED: 782,
            WORKER_MAX: 100,
            DESCRIBE: "可雇佣100个(棒子*500)。宇宙是我们的思密达。"
        )
        DRUG_FACTORY(
            id: 7,
            NAME: "月亮",
            PRICE: 50000000000,
            WORKER_NAME: "制毒的宇航员",
            WORKER_PRICE:50000000,
            WORKER_SPEED: 24560,
            WORKER_MAX: 100,
            DESCRIBE: "可雇佣100制毒的宇航员。我在月球，被囚禁了一万年。"
        )
        DRUG_FACTORY(
            id: 8,
            NAME: "冰毒星",
            PRICE: 9000000000000,
            WORKER_NAME: "病毒伞兵",
            WORKER_PRICE:50000000,
            WORKER_SPEED: 1830000,
            WORKER_MAX: 100,
            DESCRIBE: "可雇佣100个冰毒伞兵。Work Work。"
        )
        DRUG_FACTORY(
            id: 9,
            NAME: "三体星",
            PRICE: 45000000000000,
            WORKER_NAME: "三体星人",
            WORKER_PRICE:1,
            WORKER_SPEED: 2600000,
            WORKER_MAX: 200,
            DESCRIBE: "可雇佣200个三体星人。愚蠢的人类。"
        )
        //========================初始化制毒工厂信息========================
        
        
        //========================初始化成就信息========================
        //========================初始化成就信息========================
        


    }
    


    
    
    
}
