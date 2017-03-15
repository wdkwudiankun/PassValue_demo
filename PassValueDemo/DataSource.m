//
//  DataSource.m
//  PassValueDemo
//
//  Created by KUN on 2017/3/14.
//  Copyright © 2017年 WuDiankun. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

+(DataSource *)shareDatasource{

    static DataSource *dataSource = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        dataSource = [DataSource new];
    });
    return dataSource;
}

@end
