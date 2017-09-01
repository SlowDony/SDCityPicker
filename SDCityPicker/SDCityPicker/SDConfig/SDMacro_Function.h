//
//  SDMacro_Function.h
//  miaohu
//
//  Created by Megatron Joker on 2017/3/3.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

#ifndef SDMacro_Function_h
#define SDMacro_Function_h


#define mDeviceWidth [UIScreen mainScreen].bounds.size.width
#define mDeviceHeight [UIScreen mainScreen].bounds.size.height
//log扩展
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

#define mRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define mHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define mHexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define fontHightColor mHexRGB(0x919191) //字体深色
#define fontNomalColor mHexRGB(0xbbbbbb) //字体浅色
#define fontBlackColor mHexRGB(0x404040) //字体黑
#define fontBlueColor mHexRGB(0x5f76c1) //字体蓝
#define fontRedColor mHexRGB(0xf74e13) //字体红
#define bjMainColor mHexRGB(0x27bac1) //主题色
#define bjColor mHexRGB(0xf9f9f9)  //背景深灰色 mHexRGB(0xe4e4e4):浅灰
#define borderCol mHexRGB(0xe4e4e4)


#endif /* SDMacro_Function_h */
