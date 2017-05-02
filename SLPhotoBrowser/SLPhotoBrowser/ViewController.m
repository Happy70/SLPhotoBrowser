//
//  ViewController.m
//  SLPhotoBrowser
//
//  Created by apple on 2017/4/28.
//  Copyright © 2017年 lsl. All rights reserved.
//

#import "ViewController.h"
#import "SLPhotoContainerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SLPhotoContainerView *photoView = [[SLPhotoContainerView alloc] initWithFrame:CGRectMake(100, 100, 300, 0)];
    photoView.backgroundColor = [UIColor yellowColor];
    NSArray *imagesURLStrings = @[
                                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493292001907&di=5dbd59c64eaf5c6d268c510668790294&imgtype=0&src=http%3A%2F%2Fwww.51pptmoban.com%2Fd%2Ffile%2F2014%2F07%2F29%2Ffd7b4d586db805f1e919d918fdf8c4a5.jpg",
                                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493292001907&di=4ddef5aef68b415ee5fe20502fbce819&imgtype=0&src=http%3A%2F%2Fwww.ihei5.com%2Fuploads%2Fallimg%2F2015%2F06%2F09%2F1-150609161H0.jpg",
                                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493292001906&di=fc0daf922f4655eafe0123001e14a1fa&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fc8177f3e6709c93d7f6990909b3df8dcd1005439.jpg",
                                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493292179621&di=b75808157511dce60bdc9ed648dd980b&imgtype=jpg&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D2004079319%2C2983237546%26fm%3D214%26gp%3D0.jpg",
                                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493292001906&di=cfa6198ceabb3ccd622b94442aebd1ca&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3Dee2a664f52da81cb4ee683c56267d0a4%2Fcc675c087bf40ad1219d4958542c11dfa9ecce29.jpg"
                                  ];
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:imagesURLStrings];
    [self.view addSubview:photoView];
    
    
    
    photoView.picUrlArray = array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
