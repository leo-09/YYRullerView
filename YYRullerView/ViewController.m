//
//  ViewController.m
//  YYRullerView
//
//  Created by mac on 2018/8/24.
//  Copyright © 2018年 SUzhou IOM. All rights reserved.
//

#import "ViewController.h"
#import "YYScrollRulerView.h"

@interface ViewController ()<RulerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addRulerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UI

- (void) addRulerView {
    CGRect f = CGRectMake(0, 64, cy_ScreenW, 100);
    
    // 经典标尺 样式
    YYScrollRulerView *rulerClassic = [[YYScrollRulerView alloc] initWithFrame:f];
    [self.view addSubview:rulerClassic];
    rulerClassic.rulerDelegate = self;
    rulerClassic.lockMax = 24 * 60 * 60;
    rulerClassic.unitValue = 60;
    rulerClassic.step = 5;
    rulerClassic.isTimeAlias = YES;
    rulerClassic.rulerBackgroundColor = YYUIColorFromRGB(0XF2F2F2);
    rulerClassic.segmentColor = customColorMake(88, 185, 251);
    
    NSMutableArray *segments = [[NSMutableArray alloc] init];
    for (int i = 0; i < 8; i++) {
        TimeSegment *t = [[TimeSegment alloc] init];
        t.startAt = 6 * 60 * 60 + 10 * 60 + i * (60 * 60);
        t.duration = 47 * 60;
        
        [segments addObject:t];
    }
    
    rulerClassic.segments = segments;
    
    [rulerClassic customRulerWithLineColor:customColorMake(153, 153, 153)
                                  numColor:YYUIColorFromRGB(0x737373)
                              scrollEnable:YES];
    
    [rulerClassic scrollToValue:10 * 60 * 60 + 13 * 60 + 24 animation:NO];
}

#pragma mark - 标尺代理方法

- (void)rulerValue:(NSInteger)value {
    // 即时打印出标尺滑动位置的数值
    NSLog(@"当前刻度值：%ld", (long)value);
}

- (void)rulerRunEndValue:(NSInteger)value {
    NSLog(@"end ------->>>：%ld", (long)value);
}

@end
