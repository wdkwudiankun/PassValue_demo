//
//  BlockObject.h
//  PassValueDemo
//
//  Created by KUN on 2017/3/14.
//  Copyright © 2017年 WuDiankun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^changeColor)(UIColor *newColor);
@interface BlockObject : NSObject
+(void)changeColor:(changeColor)newcolor;
@end
