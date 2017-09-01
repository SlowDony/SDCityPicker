//
//  SDCityPickerViewController.h
//  miaohu
//
//  Created by slowdony on 2017/8/28.
//  Copyright © 2017年 SlowDony. All rights reserved.
//


#import <UIKit/UIKit.h>

@class SDCityModel;

@interface SDCityPickerViewController :UIViewController

@property (nonatomic,strong)NSMutableArray *dataArr;

@property (nonatomic,copy)void (^cityPickerBlock)(SDCityModel *city);
@end
