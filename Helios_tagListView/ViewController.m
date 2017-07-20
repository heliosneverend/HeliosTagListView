//
//  ViewController.m
//  Helios_tagListView
//
//  Created by beyo-zhaoyf on 2017/7/20.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "ViewController.h"
#import "BYETagListView.h"
#define HeliosRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define Screen_Width ([[UIScreen mainScreen] bounds].size.width)
#define Screen_Height ([[UIScreen mainScreen] bounds].size.height)
@interface ViewController ()
{
     TagListView *_tagListView;
    NSMutableArray *_tagArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setTagDataArray];
    [self makeUI];
    
}
- (void)setTagDataArray {
    _tagArray = [[NSMutableArray alloc]init];
    NSArray *array = @[@"第一个标签",@"第二个标签标签",@"个标签",@"第四标签个标签",@"第标签标签",@"第标签六个标签",@"签",@"第八签",@"第标签",@"个标签"];
    _tagArray = [NSMutableArray arrayWithArray:array];
    
}
- (void)makeUI {
    WeakSelf(self);
    _tagListView = [[TagListView alloc] initWithFrame:CGRectMake(0, 104, Screen_Width, 200)];
    [self.view addSubview:_tagListView];
    _tagListView.font = [UIFont systemFontOfSize:13];
    _tagListView.maxLineCount = 0;
    _tagListView.tagCurrentClickTitleBlock = ^(NSString *searchStr){
        NSLog(@"searchStr==%@",searchStr);
    };
    _tagListView.tagHeightBlock = ^(CGFloat tagHeight){
        [weakself uploadTagViewHeight:tagHeight];
    };
    _tagListView.tagFontColor = HeliosRandomColor;
    _tagListView.signalTagColor = HeliosRandomColor;
    _tagListView.GBbackgroundColor = HeliosRandomColor;
    //给标签注入数据
    [_tagListView setTagWithTagArray:_tagArray];
}
- (void)uploadTagViewHeight:(CGFloat )height {
   /*
    ** 动态修改tagView的高度
    */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
