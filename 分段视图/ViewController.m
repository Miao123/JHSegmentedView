//
//  ViewController.m
//  分段视图
//
//  Created by 苗建浩 on 2017/8/6.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"
#import "SegmentetView.h"
#import "UIView+NJ.h"
#import "UIViewExt.h"

#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHight  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) SegmentetView *topSegView;
@property (nonatomic, strong) UIScrollView *backScroll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.title = @"分段视图";
    NSArray *textArr = @[@"丰台", @"海淀", @"朝阳", @"大兴"];
    SegmentetView *topSegView = [SegmentetView initWithFrame:CGRectMake(0, 64, screenWidth, 50) textArr:textArr boundaryHidden:NO block:^(int index) {
        _backScroll.contentOffset = CGPointMake(screenWidth * index, 0);
    }];
    self.topSegView = topSegView;
    [self.view addSubview:topSegView];
    
    
    UIScrollView *backScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topSegView.bottom, screenWidth, screenHight - topSegView.height - 64)];
    backScroll.contentSize = CGSizeMake(screenWidth * textArr.count, 0);
    backScroll.delegate = self;
    backScroll.backgroundColor = [UIColor whiteColor];
    backScroll.pagingEnabled = YES;
    self.backScroll = backScroll;
    [self.view addSubview:backScroll];
}


#pragma mark ------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int index = scrollView.contentOffset.x / screenWidth;
    [_topSegView moveAnimation:index];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
