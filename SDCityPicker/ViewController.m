//
//  ViewController.m
//  SDCityPicker
//
//  Created by slowdony on 2017/8/31.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

#import "ViewController.h"
#import "SDCityPickerViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"城市选择";
    self.view.backgroundColor =[UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SDCityPickerViewController *v =[[SDCityPickerViewController alloc]init];
    
    [self.navigationController pushViewController:v animated:YES];
}

@end
