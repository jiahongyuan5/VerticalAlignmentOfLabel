//
//  UILabel+HYLabelCategory.m
//  AutoSizeCell
//
//  Created by gdxjhy on 16/5/25.
//  Copyright © 2016年 com.hongyuan.App. All rights reserved.
//

#import "UILabel+HYLabelCategory.h"
#import <objc/runtime.h>

static const void *verticalAlignmentKey = "verticalAlignment";

@implementation UILabel (HYLabelCategory)

+(void)load{
    Method m1 = class_getInstanceMethod([self class], @selector(textRectForBounds:limitedToNumberOfLines:));
    Method m2 = class_getInstanceMethod([self class], @selector(hy_textRectForBounds:limitedToNumberOfLines:));
    method_exchangeImplementations(m1, m2);
    Method method1 = class_getInstanceMethod([self class], @selector(drawTextInRect:));
    Method method2 = class_getInstanceMethod([self class], @selector(hy_drawTextInRect:));
    method_exchangeImplementations(method1, method2);
}

- (void)setVerticalAlignment:(HYLabelVerticalAlignment)verticalAlignment{
    objc_setAssociatedObject(self, verticalAlignmentKey, [NSNumber numberWithInteger:verticalAlignment], OBJC_ASSOCIATION_ASSIGN);
    [self setNeedsDisplay];
}

- (HYLabelVerticalAlignment)verticalAlignment{
   NSNumber *value = objc_getAssociatedObject(self, verticalAlignmentKey);
    return [value integerValue];
}


- (CGRect)hy_textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect rc = [self hy_textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case HYLabelVerticalAlignmentTop:
            rc.origin.y = bounds.origin.y ;
            break;
        case HYLabelVerticalAlignmentBottom:
            rc.origin.y = bounds.origin.y + bounds.size.height - rc.size.height;
            break;
        default:
            rc.origin.y = bounds.origin.y + (bounds.size.height - rc.size.height) / 2;
            break;
    }
    return rc;
}

- (void)hy_drawTextInRect:(CGRect)rect
{
    CGRect rc = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [self hy_drawTextInRect:rc];
}


@end
