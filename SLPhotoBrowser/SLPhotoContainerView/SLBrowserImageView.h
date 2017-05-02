//
//  SLBrowserImageView.h
//  GY_Teacher
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 lsl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface SLBrowserImageView : UIImageView


/**
 是否缩放
 */
@property (nonatomic, assign, readonly) BOOL isScaled;

@property (nonatomic, assign) BOOL hasLoadedImage;

// 清除缩放
- (void)eliminateScale;

// 加载图片
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

// 双击图片之后会调用
- (void)doubleTapToZommWithScale:(CGFloat)scale;

- (void)clear;

@end
