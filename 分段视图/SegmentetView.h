//
//  SegmentetView.h
//  分段视图
//
//  Created by 苗建浩 on 2017/8/6.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentetView : UIView

@property (nonatomic, copy) void(^sendIndexBlock)(int);

+ (instancetype)initWithFrame:(CGRect)frame textArr:(NSArray *)textArr boundaryHidden:(BOOL)hidden block:(void(^)(int))block;

- (void)moveAnimation:(int)index;

@end
