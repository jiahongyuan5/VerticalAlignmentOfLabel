//
//  ViewController.m
//  LabelVerticalAlignment
//
//  Created by gdxjhy on 16/6/28.
//  Copyright © 2016年 com.hongyuan.App. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+HYLabelCategory.h"
#import <objc/runtime.h>

#define DLog(format,...) NSLog(@"%s[LINE %d]"format,__PRETTY_FUNCTION__, __LINE__,##__VA_ARGS__)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)topAlignment:(UIButton *)sender {
    self.label.verticalAlignment = HYLabelVerticalAlignmentTop;
}
- (IBAction)centerAlignment:(UIButton *)sender {
    self.label.verticalAlignment = HYLabelVerticalAlignmentCenter;
}
- (IBAction)bottomAlignment:(UIButton *)sender {
    self.label.verticalAlignment = HYLabelVerticalAlignmentBottom;
}

@end
