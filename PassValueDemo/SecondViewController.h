//
//  SecondViewController.h
//  PassValueDemo
//
//  Created by KUN on 2017/3/14.
//  Copyright © 2017年 WuDiankun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block)(NSString *str);

@protocol secondDelegate <NSObject>

-(void)secondDelegate:(NSString *)title;

@end
@interface SecondViewController : UIViewController

@property (nonatomic, weak) id <secondDelegate> delegate;
@property (nonatomic, copy) Block block;

-(void)returnNameBlock:(Block)block;

@end
