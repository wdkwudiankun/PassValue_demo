//
//  DataSource.h
//  PassValueDemo
//
//  Created by KUN on 2017/3/14.
//  Copyright © 2017年 WuDiankun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

@property (nonatomic, strong) NSString *ageStr;
+(DataSource *)shareDatasource;
@end
