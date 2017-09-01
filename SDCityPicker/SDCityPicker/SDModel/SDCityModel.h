//
//  SDCityModel.h
//  miaohu
//
//  Created by slowdony on 2017/8/28.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDCityPickerConst.h"
#import "SDMacro_Function.h"


@interface SDCityModel : NSObject <NSCoding>

@property (nonatomic,strong)NSString *cityID;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *pid;
@property (nonatomic,strong)NSString *spell;
@property (nonatomic,strong)NSString *firstLetter;
//
@property (nonatomic,strong)NSMutableArray *childrens;

-(instancetype)initWithCityDict:(NSDictionary *)dic;
+(instancetype)cityWithDict:(NSDictionary *)dic;
@end
