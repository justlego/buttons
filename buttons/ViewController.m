//
//  ViewController.m
//  buttons
//
//  Created by Apple on 16/5/25.
//  Copyright © 2016年 Apple. All rights reserved.
//

#define ScreenWidth self.view.frame.size.width
#define ScreenHeight self.view.frame.size.height

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *buttonTitleArr;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation ViewController

- (NSArray *)buttonTitleArr
{
    if (!_buttonTitleArr)
    {
        _buttonTitleArr = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    }
    return _buttonTitleArr;
}

- (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame backColor:(UIColor *)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = frame;
    [button setBackgroundColor:color];
    return button;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self buttonTitleArr];
    
    
    
    for (int count = 0; count < _buttonTitleArr.count; count ++)
    {
        CGRect frame = CGRectMake(ScreenWidth * count/_buttonTitleArr.count, 64, ScreenWidth/_buttonTitleArr.count, 40);
        UIButton *button = [self createButtonWithTitle:_buttonTitleArr[count] frame:frame backColor:[UIColor redColor]];
        button.tag = count + 1000;
        [button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)clicked:(UIButton *)button
{
    [_lineView removeFromSuperview];
    _lineView = [[UIView alloc] init];
    _lineView.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y + button.frame.size.height - 2, button.frame.size.width, 2);
    _lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_lineView];
    NSLog(@"%lu",button.tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
