//
//  ViewController.m
//  VIrregularCropDemo
//
//  Created by Vols on 14-9-30.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import "ViewController.h"

#import "VCropperView.h"

#define kSCREEN_SIZE  [UIScreen mainScreen].bounds.size

@interface ViewController ()

@property (nonatomic, strong) UIButton * cropButton;
@property (nonatomic, strong) UIButton * undoButton;
@property (nonatomic, strong) UIImageView * imageView;

@property (nonatomic, strong) VCropperView *pointsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];

    [self.view addSubview:self.cropButton];
    [self.view addSubview:self.undoButton];
    
    self.imageView.frame = [VCropperView scaleRespectAspectFromRect1:CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height) toRect2:self.imageView.frame];
    self.pointsView = [[VCropperView alloc] initWithImageView:self.imageView];

    [self.pointsView addPoints:9];
    
    [self.view addSubview:self.pointsView];
    [self.view bringSubviewToFront:self.cropButton];
    [self.view bringSubviewToFront:self.undoButton];
}

- (UIButton *)cropButton{
    if (!_cropButton) {
        _cropButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cropButton.frame = CGRectMake(kSCREEN_SIZE.width - 180, kSCREEN_SIZE.height - 60, 80, 40);
        [_cropButton setTitle:@"Crop" forState:UIControlStateNormal];
        _cropButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_cropButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cropButton setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_cropButton addTarget:self action:@selector(cropAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cropButton;
}

- (UIButton *)undoButton{
    if (!_undoButton) {
        _undoButton= [UIButton buttonWithType:UIButtonTypeCustom];
        _undoButton.frame = CGRectMake(kSCREEN_SIZE.width - 80, kSCREEN_SIZE.height - 60, 80, 40);
        [_undoButton setTitle:@"Undo" forState:UIControlStateNormal];
        _undoButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_undoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_undoButton setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_undoButton addTarget:self action:@selector(undoAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _undoButton;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImage * image = [UIImage imageNamed:@"IMG_0152.JPG"];
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 20, kSCREEN_SIZE.width,kSCREEN_SIZE.width*image.size.height/image.size.width);
        _imageView.image = image;
        _imageView.backgroundColor = [UIColor orangeColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

- (void)cropAction:(UIButton *)button{
    self.imageView.image = [self.pointsView deleteBackgroundOfImage:self.imageView];
}

- (void)undoAction:(UIButton *)button{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
