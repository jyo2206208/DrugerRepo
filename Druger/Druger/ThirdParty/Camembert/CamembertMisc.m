//
//  ExecSqlite3.m
//  SwiftSQL
//
//  Created by Remi Robert on 25/08/14.
//  Copyright (c) 2014 remirobert. All rights reserved.
//

#import "Camembert.h"

BOOL camembertExecSqlite3(void *ptrSqlite3, const char *request) {
    char *msgErr;
    if (sqlite3_exec(ptrSqlite3, request, NULL, nil, &msgErr) != SQLITE_OK) {
        if (msgErr != nil)
            NSLog(@"Error exec sqlite3 statement %s", msgErr);
        else
            NSLog(@"Error exec sqlite3 statement");
        return false;
    }
    return true;
}

id camembertCreateObject(NSString *nameClass) {
    //本框架原来的部分需要取得Bundle。因为这个名字我是中文的所以会出问题.现改成CFBundleExecutable
//    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleExecutable"];
    NSString *classStringName = [NSString stringWithFormat:@"_TtC%lu%@%lu%@", (unsigned long)appName.length,
                                 appName, (unsigned long)nameClass.length, nameClass];
    
    Class customClass = NSClassFromString(classStringName);
    if (customClass == nil) {
        return nil;
    }
    return [[customClass alloc] init];
}