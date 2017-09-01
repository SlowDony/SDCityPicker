//
//  SDCityPickerTableViewCell.h
//  miaohu
//
//  Created by slowdony on 2017/8/30.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDMacro_Function.h"
@interface SDCityPickerTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end
