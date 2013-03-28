//
//  XLViewController.m
//  CycleScrollViewDemo
//
//  Created by xie liang on 9/14/12.
//  Copyright (c) 2012 xie liang. All rights reserved.
//

#import "XLViewController.h"

@interface XLViewController ()

@end

@implementation XLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    XLCycleScrollView *csView = [[XLCycleScrollView alloc] initWithFrame:self.view.bounds];
    csView.delegate = self;
    csView.datasource = self;
    [self.view addSubview:csView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfPages
{
    return 5;
}

- (UIView *)pageAtIndex:(NSInteger)index
{
    UIView* aView =[[[UIView alloc] initWithFrame:self.view.bounds] autorelease];
    
    UIImageView* imgV = [[[UIImageView alloc] initWithFrame:self.view.bounds] autorelease];
    imgV.image = [UIImage imageNamed:@"0_loading.jpg"];
    [aView addSubview:imgV];
    
    UILabel *l = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    l.text = [NSString stringWithFormat:@"%d",index];
    l.font = [UIFont systemFontOfSize:72];
    l.textAlignment = UITextAlignmentCenter;
    l.backgroundColor = [UIColor clearColor];
    [aView addSubview:l];
    
    return aView;
}

- (void)didClickPage:(XLCycleScrollView *)csView atIndex:(NSInteger)index
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:[NSString stringWithFormat:@"当前点击第%d个页面",index]
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

@end
