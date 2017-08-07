//
//  SegmentetView.m
//  分段视图
//
//  Created by 苗建浩 on 2017/8/6.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "SegmentetView.h"
#import "UIView+NJ.h"

#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHight  [UIScreen mainScreen].bounds.size.height
@interface SegmentetView ()

@property (nonatomic, strong) UISegmentedControl *showSegment;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, assign) int number;

@end

@implementation SegmentetView

+ (instancetype)initWithFrame:(CGRect)frame textArr:(NSArray *)textArr boundaryHidden:(BOOL)hidden block:(void (^)(int))block{
    SegmentetView *segmentView = [[SegmentetView alloc] initWithFrame:frame];
    segmentView.sendIndexBlock = block;
    segmentView.number = (int)textArr.count * 3;
    [segmentView frame:frame textArr:textArr boundaryHidden:hidden];
    return segmentView;
}


- (void)frame:(CGRect)frame textArr:(NSArray *)textArr boundaryHidden:(BOOL)hidden{
    
    UISegmentedControl *showSegment = [[UISegmentedControl alloc] initWithItems:textArr];
    showSegment.frame = CGRectMake(0, 0, frame.size.width, frame.size.height - 1.2);
    showSegment.selectedSegmentIndex = 0;
    showSegment.backgroundColor = [UIColor whiteColor];
    showSegment.tintColor = [UIColor whiteColor];
    //设置普通状态下(未选中)状态下的文字颜色和字体
    [showSegment setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17 weight:UIFontWeightThin],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    //设置选中状态下的文字颜色和字体
    [showSegment setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17 weight:UIFontWeightThin],NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
    [showSegment addTarget:self action:@selector(showSegmentClick:) forControlEvents:UIControlEventValueChanged];
    self.showSegment = showSegment;
    [self addSubview:showSegment];
    
    if (!hidden) {
        for (int i = 0; i < textArr.count; i++) {
            UIView *middleLineView = [[UIView alloc] initWithFrame:CGRectMake(screenWidth / textArr.count * (i + 1), 10, 1,  30)];
            middleLineView.backgroundColor = [UIColor darkGrayColor];
            [self addSubview:middleLineView];
        }
    }else{
        
    }
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(screenWidth / _number - (textArr.count + 2), frame.size.height - 1, screenWidth / _number + (2 * (textArr.count + 2)), 1.2)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    self.lineView = lineView;
    [self addSubview:lineView];
}


- (void)showSegmentClick:(UISegmentedControl *)seg{
    int index = (int)seg.selectedSegmentIndex;
    [self moveAnimation:index];
    if (self.sendIndexBlock) {
        self.sendIndexBlock(index);
    }
}


- (void)moveAnimation:(int)index{
    self.showSegment.selectedSegmentIndex = index;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.x = screenWidth / _number + screenWidth / _number * index * 3 - (_number / 3 + 2);
    }];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
