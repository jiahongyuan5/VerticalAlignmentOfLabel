//
//  UILabel+HYLabelCategory.h
//  AutoSizeCell
//
//  Created by gdxjhy on 16/5/25.
//  Copyright © 2016年 com.hongyuan.App. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HYLabelVerticalAlignment){
    HYLabelVerticalAlignmentCenter  = 0,
    HYLabelVerticalAlignmentTop,
    HYLabelVerticalAlignmentBottom
};

@interface UILabel (HYLabelCategory)

@property (nonatomic) HYLabelVerticalAlignment verticalAlignment;

@end
