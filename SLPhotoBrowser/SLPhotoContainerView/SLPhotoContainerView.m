//
//  SLPhotoContainerView.m
//  GY_Teacher
//
//  Created by apple on 2017/4/8.
//  Copyright © 2017年 lsl. All rights reserved.
//

#import "SLPhotoContainerView.h"
#import "SLPhotoBrowser.h"
#import "UIView+Frame.h"
#import "Masonry.h"

static NSUInteger const MaxPicCount = 9;

@interface SLPhotoContainerView ()
<
SLPhotoBrowserDelegate
>

@property (strong, nonatomic) NSMutableArray    *imageViewArray;

@end

@implementation SLPhotoContainerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
    }
    return self;
}

- (void)setupImageView {
    NSMutableArray *temp = [NSMutableArray new];
    
    //最多9张图片，初始化imageView
    for (int i = 0; i < MaxPicCount; i ++) {
        UIImageView *imageView = [UIImageView new];
        [self addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.tag = i;
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedImageView:)];
        [imageView addGestureRecognizer:tap];
        //放入到数组中
        [temp addObject:imageView];
    }
    
    self.imageViewArray = [temp copy];
}

- (void)setPicUrlArray:(NSMutableArray *)picUrlArray {
    _picUrlArray = picUrlArray;
    
    //隐藏多余的imageView
    for (long i = [_picUrlArray count]; i < [_imageViewArray count]; i ++) {
        UIImageView *imageView = _imageViewArray[i];
        imageView.hidden = YES;
    }
    //如果没图片返回高度为0
    if ([_picUrlArray count] == 0) {
        self.height = 0;
        return;
    }
    
    //图片的宽度和高度一样 每行最多3张
    CGFloat width   = (self.width - 20)/3;
    CGFloat height  = width;
    CGFloat margin  = 10;
    
    //枚举
    [_picUrlArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //列数 行数
        NSInteger columnIndex = idx % 3;
        NSInteger rowIndex = idx / 3;
        
        UIImageView *imageView = _imageViewArray[idx];
        imageView.hidden = NO;
        imageView.frame  = CGRectMake(columnIndex * (width + margin), rowIndex * (height + margin), width, height);
        NSString *imgUrl = _picUrlArray[idx];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:PLACEHOLDERPNG];
        
    }];
    
    
    NSInteger column = [self columnCountForArray:_picUrlArray];
    CGFloat w = column * (width + margin);
    NSInteger row = [self rowCountForArray:_picUrlArray];
    CGFloat h = row * (height + margin);
    
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(w, h));
        make.left.offset(50);
        make.top.offset(100);
    }];
    
}

- (void)clickedImageView:(UITapGestureRecognizer *)tap {
    SLPhotoBrowser *browser = [[SLPhotoBrowser alloc] init];
    browser.currentImageIndex = tap.view.tag;
    browser.sourceImagesContainerView = self;
    browser.imageCount = self.picUrlArray.count;
    browser.delegate   = self;
    
    //显示大图浏览
    [browser show];
}

#pragma mark - 
#pragma mark - SLPhotoBrowserDelegate
- (NSURL *)photoBrowser:(SLPhotoBrowser *)browser imageURLForIndex:(NSInteger)index {
    NSString *image = self.picUrlArray[index];
    return [NSURL URLWithString:image];
}

- (UIImage *)photoBrowser:(SLPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    UIImageView *imageView = self.subviews[index];
    return imageView.image;
}

//有多少列
- (NSInteger)columnCountForArray:(NSArray *)array
{
    if (array.count < 2) {
        return 1;
    } else if (array.count < 3) {
        return 2;
    } else {
        return 3;
    }
}

//有多少行
- (NSInteger)rowCountForArray:(NSArray *)array
{
    if (array.count < 4) {
        return 1;
    } else if (array.count < 7) {
        return 2;
    } else {
        return 3;
    }
}

@end
