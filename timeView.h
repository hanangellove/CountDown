//
//  timeView.h
//  BigMouthMall
//
//  Created by Han liu on 15/6/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface timeView : UIView
@property (nonatomic,strong)UILabel * hours;
@property (nonatomic,strong)UILabel * min;
@property (nonatomic,strong)UILabel * sec;

@property (nonatomic,assign)NSInteger currentTimeLefted;

- (instancetype)initWithFrame:(CGRect)frame AndTime:(NSInteger)limitTime;
@end
