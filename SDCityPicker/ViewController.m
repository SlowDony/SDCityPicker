//
//  ViewController.m
//  SDCityPicker
//
//  Created by slowdony on 2017/8/31.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

#import "ViewController.h"
#import "SDCityPickerViewController.h"
#import "SDCityInitial.h"
#import "SDCityModel.h"

#define historyCityFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"historyCity.data"]

@interface ViewController ()
@property (nonatomic,strong)NSMutableArray *dataArr;

/**
 热门
 */
@property (nonatomic,strong)NSMutableArray *hotArr;


/**
 历史
 */
@property (nonatomic,strong)NSMutableArray *historyArr;


/**
 当前选择
 */
@property (nonatomic,strong)NSMutableArray *selectArr;

@property (nonatomic,strong)UIButton *btn; //左按钮
@property (nonatomic,strong)NSMutableArray *historySelectArr;
@property (nonatomic,strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"城市选择";
    self.view.backgroundColor =[UIColor whiteColor];
    [self setupUI];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)selectCityClick:(UIButton *)sender{
    
}
- (void)setupUI{
    
    //
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 100, mDeviceWidth, 50);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    
    label.text = [NSString stringWithFormat:@"当前选择城市:%@",self.historySelectArr.count==0?@"无":((SDCityModel *)self.historySelectArr.firstObject).name] ;
    label.textAlignment = NSTextAlignmentCenter;
    self.label = label;
    label.font = [UIFont systemFontOfSize:17];
    label.numberOfLines = 1;
    [self.view addSubview:label];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    SDCityPickerViewController *city =[[SDCityPickerViewController alloc]init];
    city.cityPickerBlock = ^(SDCityModel *city)
    {
        self.navigationItem.title = city.name;
        [self.historyArr insertObject:city atIndex:0];
        [self setSelectCityModel:city];
        self.label.text = [NSString stringWithFormat:@"当前选择城市:%@",city.name];
    };
    city.dataArr = [NSMutableArray arrayWithArray:self.dataArr];
    [self.navigationController pushViewController:city animated:YES];
}

-(void)setSelectCityModel:(SDCityModel *)city{
    
    [self.historyArr removeAllObjects];
    
    SDCityInitial *cityInitial = [[SDCityInitial alloc]init];
    cityInitial.initial = @"历史";
    
    [self historySelectArr];
    //    [_historySelectArr removeObject:city];
    //    [_historySelectArr insertObject:city atIndex:0];
    
    NSMutableArray *emptyArr =[NSMutableArray arrayWithArray:_historySelectArr];
    
    //    for (SDCityModel *hiscity in emptyArr) {
    //        if ([hiscity.name isEqualToString:city.name]) {
    //            [_historySelectArr removeObject:city];
    //        }
    //    }
    
    [emptyArr enumerateObjectsUsingBlock:^(SDCityModel  *_Nonnull hiscity, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([hiscity.name isEqualToString:city.name]) {
            [_historySelectArr removeObjectAtIndex:idx];
            *stop =YES;
        }
        
    }];
    
    
    [_historySelectArr insertObject:city atIndex:0];
    
    if (_historySelectArr.count>6){
        [_historySelectArr removeLastObject];
    }
    
    [NSKeyedArchiver archiveRootObject:_historySelectArr toFile:historyCityFilepath];
    
    cityInitial.cityArrs = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:historyCityFilepath]];
    
    
    
    [self.historyArr addObject:cityInitial];
    
    [self.dataArr replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndex:1] withObjects:self.historyArr];
}


/**
 定位选择
 
 */
-(NSMutableArray *)selectArr{
    if (!_selectArr){
        _selectArr = [NSMutableArray array];
        SDCityInitial *cityInitial =[[SDCityInitial alloc]init];
        cityInitial.initial = @"定位";
        SDCityModel *city = [[SDCityModel alloc]init];
        city.name = @"西安";
        NSMutableArray *selectArrs =[NSMutableArray array];
        [selectArrs addObject:city];
        cityInitial.cityArrs = selectArrs;
        [_selectArr addObject:cityInitial];
        
    }
    return _selectArr;
}

/**
 历史
 
 */
-(NSMutableArray *)historyArr{
    if (!_historyArr){
        _historyArr = [NSMutableArray array];
        SDCityInitial *cityInitial =[[SDCityInitial alloc]init];
        cityInitial.initial = @"历史";
        cityInitial.cityArrs = self.historySelectArr;
        
        
        [_historyArr addObject:cityInitial];
    }
    return _historyArr;
}
-(NSMutableArray *)historySelectArr{
    if (!_historySelectArr){
        _historySelectArr = [NSKeyedUnarchiver unarchiveObjectWithFile:historyCityFilepath];
        if (!_historySelectArr){
            _historySelectArr =[NSMutableArray array];
        }
    }
    return _historySelectArr;
}

/**
 热门
 
 */
-(NSMutableArray *)hotArr{
    if(!_hotArr){
        _hotArr = [NSMutableArray array];
        SDCityInitial *cityInitial =[[SDCityInitial alloc]init];
        cityInitial.initial = @"热门";
        
        NSArray *hotCityArr =@[@{@"id":@"1",@"name":@"北京",@"pid":@"11"},
                               @{@"id":@"2",@"name":@"上海",@"pid":@"11"},
                               @{@"id":@"3",@"name":@"广州",@"pid":@"11"},
                               @{@"id":@"4",@"name":@"深圳",@"pid":@"11"},
                               @{@"id":@"4",@"name":@"成都",@"pid":@"11"},
                               @{@"id":@"4",@"name":@"杭州",@"pid":@"11"},
                               ];
        NSMutableArray *hotarrs =[NSMutableArray array];
        
        for (NSDictionary *dic in hotCityArr){
            SDCityModel *city = [SDCityModel cityWithDict:dic];
            [hotarrs addObject:city];
        }
        cityInitial.cityArrs = hotarrs;
        [_hotArr addObject:cityInitial];
    }
    return _hotArr;
    
}


-(NSMutableArray *)dataArr{
    if (!_dataArr){
        
        _dataArr =[NSMutableArray array];
        
        
        
        NSString *path =[[NSBundle mainBundle]pathForResource:@"City" ofType:@"plist"];
        
        
        NSArray *arr =[NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *cityModels = [NSMutableArray array];
        
        //获取全部城市cityModel
        for (NSDictionary *dic in arr){
            for (NSDictionary *dict in dic[@"children"]){
                SDCityModel *cityModel = [SDCityModel cityWithDict:dict];
                [cityModels addObject:cityModel];
            }
        }
        
        //获取首字母
        NSMutableArray *indexArr =
        [[cityModels valueForKeyPath:@"firstLetter"] valueForKeyPath:@"@distinctUnionOfObjects.self"];
        
        //遍历数组
        for (NSString *indexStr in indexArr) {
            
            SDCityInitial *cityInitial =[[SDCityInitial alloc]init];
            cityInitial.initial = indexStr;
            NSMutableArray *cityArrs =[NSMutableArray array];
            for ( SDCityModel *cityModel in cityModels) {
                if ([indexStr isEqualToString:cityModel.firstLetter]) {
                    [cityArrs addObject:cityModel];
                    
                }
            }
            cityInitial.cityArrs = cityArrs;
            [_dataArr addObject:cityInitial];
        }
        
        
        [_dataArr insertObjects:self.hotArr atIndexes:[NSIndexSet indexSetWithIndex:0]];
        [_dataArr insertObjects:self.historyArr atIndexes:[NSIndexSet indexSetWithIndex:0]];
        [_dataArr insertObjects:self.selectArr atIndexes:[NSIndexSet indexSetWithIndex:0]];
        
        
    }
    return _dataArr;
}

@end
