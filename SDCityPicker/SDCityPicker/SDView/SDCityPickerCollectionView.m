//
//  SDCityPickerCollectionView.m
//  miaohu
//
//  Created by slowdony on 2017/8/30.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

#import "SDCityPickerCollectionView.h"

#define SDCityPickerCellID @"SDCityPickerCellID"

#import "SDCityModel.h"
@interface SDCityPickerCollectionView ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@end


@implementation SDCityPickerCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self =[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        //注册
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:SDCityPickerCellID];
    }
    return  self;
}

#pragma mark ----------UICollectionViewDelegate----------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SDCityPickerCellID forIndexPath:indexPath];
    
    //配置数据

    SDCityModel *city =self.dataArr[indexPath.row];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%@",city.name];
//    label.text = @"哈哈";
    label.frame = CGRectMake(0, 10,(mDeviceWidth-60)/3, 32);
    label.font = [UIFont systemFontOfSize:15];
    label.layer.cornerRadius = 4.0;
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = fontHightColor;
    label.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.3];
    [cell.contentView addSubview:label];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SDCityModel *city = self.dataArr[indexPath.row];
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[SDCityDidSelectKey] = city;
    [[NSNotificationCenter defaultCenter] postNotificationName:SDCityDidSelectedNotification object:nil userInfo:userInfo];
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((mDeviceWidth-60)/3, 32);
}



@end
