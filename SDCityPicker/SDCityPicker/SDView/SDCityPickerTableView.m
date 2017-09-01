//
//  SDCityPickerTableView.m
//  miaohu
//
//  Created by slowdony on 2017/8/28.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

#import "SDCityPickerTableView.h"
#import "SDCityModel.h"
#import "SDCityInitial.h"

#import "SDCityPickerTableViewCell.h"
@implementation SDCityPickerTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self =[super initWithFrame:frame style:style];
    if (self) {
        self.dataSource=self;
        self.delegate=self;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//        self.sectionIndexColor = bjMainColor;
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    
}
#pragma mark ----------UITabelViewDataSource----------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return  self.dataArray.count ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0 || section == 1 ||section == 2){
        return 1;
    }else {
        SDCityInitial  *cityInitial = self.dataArray[section];
        return  cityInitial.cityArrs.count;
    }
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    SDCityPickerTableViewCell *cityCell = [SDCityPickerTableViewCell cellWithTableView:self];
    //配置数据
    //    省
    SDCityInitial *cityInitial = self.dataArray[indexPath.section];
    
    if (cityInitial.cityArrs.count ==0){
        return cell;
    }else {
        SDCityModel *city = cityInitial.cityArrs[indexPath.row];
        
        if (indexPath.section == 0 ||indexPath.section ==1 ||indexPath.section ==2){
            
            cityCell.dataArr = [NSMutableArray arrayWithArray:cityInitial.cityArrs];
            cityCell.backgroundColor = [UIColor redColor];
            
            return cityCell;
            
        }else {
            cell.textLabel.text = city.name;
            return cell;
        }
    }
}

#pragma mark ----------UITabelViewDelegate----------

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.sd_delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
        [self.sd_delegate tableView:self didSelectRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 ||indexPath.section ==1 ||indexPath.section ==2){
        
        SDCityInitial *cityInitial = self.dataArray[indexPath.section];
        
        CGFloat cellHeight = 0;
        
        if (cityInitial.cityArrs.count ==0){
            return cellHeight ;
        }
        else {
            if (0 == (cityInitial.cityArrs.count % 3)) {
                cellHeight = cityInitial.cityArrs.count / 3 * 50;
            }else {
                cellHeight = (cityInitial.cityArrs.count / 3 + 1) * 50;
            }
            if (cellHeight > 300) {
                cellHeight = 300;
            }
            return cellHeight ;
        }
  
    }else {
        return 50;
    }
  
}



/**
 索引值
 
 */
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{

    //数组调用valueForKeyPath 返回一个 SDCityInitial模型里的initial属性的值,放在一个数组中返回
    
    NSMutableArray *indexArrs =[NSMutableArray array];
    for ( SDCityInitial *cityInitial in self.dataArray){
        if (cityInitial.cityArrs.count>0)
        {
            [indexArrs addObject:cityInitial.initial];
        }
    }
    
    
    return  indexArrs;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    SDCityInitial *cityInitial = self.dataArray[section];

    return (cityInitial.cityArrs.count)==0 ? 0:50;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headview = [[UIView alloc] init];
    headview.frame = CGRectMake(0, 0, mDeviceWidth, 50);
    headview.backgroundColor = bjColor;
    
    //标题
    UILabel *headlabel = [[UILabel alloc] init];
    headlabel.frame = CGRectMake(20, 0, mDeviceWidth, 50);
    headlabel.backgroundColor = [UIColor clearColor];
    headlabel.textColor = fontBlackColor;
    SDCityInitial *cityInitial = self.dataArray[section];
    headlabel.text = [NSString stringWithFormat:@"%@",cityInitial.initial];
    headlabel.textAlignment = NSTextAlignmentLeft;
    headlabel.font = [UIFont systemFontOfSize:15];
    headlabel.numberOfLines = 1;
    [headview addSubview:headlabel];
    
    return headview;
}

@end
