//
//  FirstViewController.m
//  PassValueDemo
//
//  Created by KUN on 2017/3/14.
//  Copyright © 2017年 WuDiankun. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "DataSource.h"
#import "BlockObject.h"

@interface FirstViewController () <secondDelegate>
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showAge:) name:@"yourAge" object:nil];
    
}

-(void)viewDidAppear:(BOOL)animated{

    // NSUserDefaults
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"age"] length]!= 0) {
        self.firstLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"age"];
    }

    // singleton
    DataSource *datasource = [DataSource shareDatasource];
    if ([datasource.ageStr length] != 0) {
        self.firstLabel.text = datasource.ageStr;
        datasource.ageStr = @"";
    }
    
}


/************************        NSNotification     ****************************/
-(void)showAge:(NSNotification *)noti{

    NSDictionary *ageDic = [noti userInfo];
    self.firstLabel.text = [ageDic objectForKey:@"name"];
}


/************************        block     ****************************/
- (IBAction)changeButtonColor:(id)sender {
    
    [BlockObject changeColor:^(UIColor *newColor) {
        UIButton *btn = sender;
        btn.backgroundColor = newColor;
    }];
}
- (IBAction)blockPush:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [secondVC returnNameBlock:^(NSString *str) {
        _firstLabel.text = str;
    }];
    [self presentViewController:secondVC animated:YES completion:nil];
}


/************************        delegate     ****************************/
- (IBAction)pushNextController:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.delegate = self;
    [self presentViewController:secondVC animated:YES completion:nil];
}
-(void)secondDelegate:(NSString *)title{

    _firstLabel.text = title;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
