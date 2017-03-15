//
//  SecondViewController.m
//  PassValueDemo
//
//  Created by KUN on 2017/3/14.
//  Copyright © 2017年 WuDiankun. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "DataSource.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.ageTextField resignFirstResponder];
}

//cancel
- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/************************        userDefault     ****************************/
- (IBAction)userDefault:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setObject:self.ageTextField.text forKey:@"age"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/************************        singleton     ****************************/
- (IBAction)singleton:(id)sender {
    
    DataSource *datasource = [DataSource shareDatasource];
    datasource.ageStr = self.ageTextField.text;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/************************        notification     ****************************/
- (IBAction)notification:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"yourAge" object:self userInfo:@{@"name":self.ageTextField.text}];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/************************        block     ****************************/
- (IBAction)block:(id)sender {
    
    if (self.block) {
        self.block(self.ageTextField.text);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)returnNameBlock:(Block)block{

    self.block = block;
}

/************************        delegate     ****************************/
- (IBAction)delegate:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(secondDelegate:)]) {
        [self.delegate secondDelegate:_ageTextField.text];
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
