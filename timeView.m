//
//  timeView.m
//  BigMouthMall
//
//  Created by Han liu on 15/6/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "timeView.h"

@implementation timeView

- (instancetype)initWithFrame:(CGRect)frame AndTime:(NSInteger)limitTime
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addLabels:limitTime];
    }
    return self;
}

- (void)addLabels:(NSInteger)limitActTime{
    NSInteger hour = 0;
    NSInteger min  = 0;
    NSInteger sed  = 0;
    if (limitActTime>0) {
        hour = limitActTime/3600;
        
        min  = (limitActTime-hour*3600)/60;
        
        sed  = limitActTime-hour*3600-min*60;
    }

    
    _hours = [[UILabel alloc]initWithFrame:CGRectMake(2, 1, 30, 16)];
    _hours.backgroundColor = [UIColor redColor];
    _hours.text = [NSString stringWithFormat:@"%.2d",hour];
    _hours.textColor = [UIColor whiteColor];
    _hours.font = [UIFont systemFontOfSize:12];
    _hours.textAlignment = NSTextAlignmentCenter;
    _hours.layer.cornerRadius = 5;
    _hours.clipsToBounds = YES;
    
    UILabel * colon1 = [[UILabel alloc]initWithFrame:CGRectMake(33, 1, 10, 16)];
    colon1.text = @":";
    colon1.textColor = [UIColor redColor];
    
    _min = [[UILabel alloc]initWithFrame:CGRectMake(40, 1, 20, 16)];
    _min.backgroundColor = [UIColor redColor];
    _min.text = [NSString stringWithFormat:@"%.2d",min];;
    _min.textColor = [UIColor whiteColor];
    _min.font = [UIFont systemFontOfSize:12];
    _min.textAlignment = NSTextAlignmentCenter;
    _min.layer.cornerRadius = 5;
    _min.clipsToBounds = YES;
    
    UILabel * colon2 = [[UILabel alloc]initWithFrame:CGRectMake(61, 1, 10, 16)];
    colon2.text = @":";
    colon2.textColor = [UIColor redColor];
    
    _sec = [[UILabel alloc]initWithFrame:CGRectMake(69, 1, 20, 16)];
    _sec.backgroundColor = [UIColor redColor];
    _sec.text = [NSString stringWithFormat:@"%.2d",sed];;
    _sec.textColor = [UIColor whiteColor];
    _sec.font = [UIFont systemFontOfSize:12];
    _sec.textAlignment = NSTextAlignmentCenter;
    _sec.layer.cornerRadius = 5;
    _sec.clipsToBounds = YES;
    
    
    [self addSubview:_hours];
    [self addSubview:colon1];
    [self addSubview:_min];
    [self addSubview:colon2];
    [self addSubview:_sec];
    if (limitActTime > 0) {
        NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeDown) userInfo:nil repeats:YES];
        NSRunLoop * runloop = [NSRunLoop currentRunLoop];
        [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    }
    
}

- (void)timeDown{
    NSInteger sed = [_sec.text integerValue];
    NSInteger min = [_min.text integerValue];
    NSInteger hour= [_hours.text integerValue];
    sed--;
    if (sed == -1) {
        sed = 59;
        min--;
        if (min== -1) {
            min = 59;
            hour--;

        }
        
    }
    _currentTimeLefted = sed + min*60 + hour*3600;
    
    _hours.text = [NSString stringWithFormat:@"%.2d",hour];
    _min.text   = [NSString stringWithFormat:@"%.2d",min];;
    _sec.text   = [NSString stringWithFormat:@"%.2d",sed];;

    
}
@end
