//
//  SDCityModel.m
//  miaohu
//
//  Created by slowdony on 2017/8/28.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

#import "SDCityModel.h"

@implementation SDCityModel

-(instancetype)initWithCityDict:(NSDictionary *)dic{
    self =[super init];
    if (self){
        self.cityID = dic[@"id"];
        self.name = dic[@"name"];
        self.pid = dic[@"pid"];
        self.spell = dic[@"spell"];
        self.firstLetter = [self transform:self.name];
    }
    return self;
}

+(instancetype)cityWithDict:(NSDictionary *)dic{
    return [[self alloc]initWithCityDict:dic];
}
//git rm --cached SDSwift.xcodeproj/project.xcworkspace/xcuserdata/slowdony.xcuserdatad/UserInterfaceState.xcuserstate
//git commit -m "Removed file that shouldn't be tracked"
//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if ([super init]){
        self.cityID = [aDecoder decodeObjectForKey:@"id"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.pid = [aDecoder decodeObjectForKey:@"pid"];
        self.spell =[aDecoder decodeObjectForKey:@"spell"];
    }
    return self;
}
//归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.cityID forKey:@"id"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.pid forKey:@"pid"];
    [aCoder encodeObject:self.spell forKey:@"spell"];

    
}




- (NSString *)transform:(NSString *)chinese
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:chinese];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}





@end
