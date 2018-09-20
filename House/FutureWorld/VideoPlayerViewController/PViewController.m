//
//  PViewController.m
//  House
//
//  Created by 张孝飞 on 2018/8/27.
//  Copyright © 2018年 张孝飞. All rights reserved.
//



#import "PViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"

@interface PViewController ()
@property(nonatomic,strong)AVPlayer *avPlayer;
@property(nonatomic,strong)AVPlayerLayer *avlayer;
@property(nonatomic,strong)UIButton *returnButton;

@end

@implementation PViewController

-(UIButton *)returnButton {
    if (!_returnButton) {
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (systemVersion.doubleValue >= 8.0) {
            _returnButton.frame = CGRectMake(kScreenW-100, 50, 80, 80);
        } else {
            _returnButton.frame = CGRectMake(kScreenH-100, 50, 80, 80);
        }
        _returnButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_returnButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"return.png" ofType:nil]] forState:UIControlStateNormal];
        [_returnButton addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:nil];
//    NSURL *urlMovie = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"guide" ofType:@"mp4"]];
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:[NSURL fileURLWithPath:_assetUrlString] options:nil];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    _avPlayer = [AVPlayer playerWithPlayerItem: playerItem];
    _avlayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    
    //    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    if (systemVersion.doubleValue >= 8.0) {
        _avlayer.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    } else {
        _avlayer.frame = CGRectMake(0, 0, kScreenH, kScreenW);
    }
    
    _avlayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.view.layer addSublayer:_avlayer];
  
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification   object:self.avPlayer.currentItem];
    
    [_avPlayer seekToTime:kCMTimeZero];
    [_avPlayer play];
    [self.view addSubview:self.returnButton];
    
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)playbackFinished:(NSNotification *)noti
{
    [self finish];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
//    [self finish];
}

-(void)finish {
    [_avPlayer pause];
    
    [self.avlayer removeFromSuperlayer];
    self.avlayer=nil;
    self.avPlayer=nil;
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

