//
//  SDCityPickerViewController.m
//  miaohu
//
//  Created by slowdony on 2017/8/28.
//  Copyright © 2017年 SlowDony. All rights reserved.
//

/*
 github地址:https://github.com/SlowDony/SDCityPicker
 城市选择器 
 
 我的邮箱：devslowdony@gmail.com
 
 如果有好的建议或者意见 ,欢迎指出 , 您的支持是对我最大的鼓励,谢谢. 求STAR ..😆
 */
#import "SDCityPickerViewController.h"

#import "SDCityPickerTableView.h"
#import "SDCityModel.h"

#import "SDCityInitial.h"
@interface SDCityPickerViewController ()
<SDBaseTableViewDelegate>
@property (nonatomic,strong)SDCityPickerTableView *cityTableView;


@end

@implementation SDCityPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"切换城市";
    [self setupTableView];
    [self addNotification];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(SDCityPickerTableView *)cityTableView{
    if (!_cityTableView){
        //
        _cityTableView = [[SDCityPickerTableView alloc] initWithFrame:CGRectMake(0,0, mDeviceWidth, mDeviceHeight) style:UITableViewStylePlain];
        _cityTableView.sd_delegate =self;
        
    }
    return _cityTableView;
}

-(void)setupTableView{
    [self.view addSubview:self.cityTableView];
    self.cityTableView.dataArray =self.dataArr;
    [self.cityTableView reloadData];
    
}

#pragma mark - SDCityPickerTableViewDelegate

-(void)tableView:(id)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SDCityInitial *cityInitial = self.dataArr[indexPath.section];
    
    SDCityModel *city = cityInitial.cityArrs[indexPath.row];
    DLog(@"cityName:%@",city.name);
    if (self.cityPickerBlock){
        self.cityPickerBlock(city);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cityDidSelected:) name:SDCityDidSelectedNotification object:nil];
}

-(void)cityDidSelected:(NSNotification *)notif{
    NSDictionary *userInfo = notif.userInfo;
    SDCityModel *city = userInfo[SDCityDidSelectKey];
    DLog(@"cityName:%@",city.name);
    
    if (self.cityPickerBlock){
        self.cityPickerBlock(city);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
