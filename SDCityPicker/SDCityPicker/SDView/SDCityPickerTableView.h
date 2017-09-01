//
//  SDCityPickerTableView.h
//  miaohu
//
//  Created by slowdony on 2017/8/28.
//  Copyright © 2017年 SlowDony. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol SDBaseTableViewDelegate <NSObject>

-(void)tableView:(id)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface SDCityPickerTableView : UITableView
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) id<SDBaseTableViewDelegate>sd_delegate;//
@property (nonatomic,strong)NSMutableArray *dataArray;
@end
