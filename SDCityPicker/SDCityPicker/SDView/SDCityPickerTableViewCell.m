//
//  SDCityPickerTableViewCell.m
//  miaohu
//
//  Created by slowdony on 2017/8/30.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

#import "SDCityPickerTableViewCell.h"
#import "SDCityPickerCollectionView.h"


@interface SDCityPickerTableViewCell ()
@property (nonatomic,strong)SDCityPickerCollectionView *cityCollectionView;

@end

@implementation SDCityPickerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"id";
    SDCityPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        
        cell =[[SDCityPickerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self) {
         [self addSubview:self.cityCollectionView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.cityCollectionView.frame =self.bounds;
    DLog(@"self.bounds:%@",NSStringFromCGRect(self.bounds));
   
}

-(SDCityPickerCollectionView *)cityCollectionView{
    if (!_cityCollectionView){
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        _cityCollectionView = [[SDCityPickerCollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _cityCollectionView.scrollEnabled = YES;
        _cityCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _cityCollectionView;
}
-(void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr = dataArr;
    _cityCollectionView.dataArr = dataArr;
    [_cityCollectionView reloadData];
}
@end
