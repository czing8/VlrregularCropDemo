//
//  VCropperView.h
//  VIrregularCropDemo
//
//  Created by Vols on 14-9-30.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCropperView : UIView

@property (nonatomic, strong) UIColor *pointColor;
@property (nonatomic, strong) UIColor *lineColor;

- (id)initWithImageView:(UIImageView *)imageView;
- (NSArray *)getPoints;
- (UIImage *)deleteBackgroundOfImage:(UIImageView *)image;

- (void)addPointsAt:(NSArray *)points;
- (void)addPoints:(int)num;

+ (CGPoint)convertPoint:(CGPoint)point1 fromRect1:(CGSize)rect1 toRect2:(CGSize)rect2;
+ (CGRect)scaleRespectAspectFromRect1:(CGRect)rect1 toRect2:(CGRect)rect2;

@end
