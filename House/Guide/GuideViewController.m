//
//  GuideViewController.m
//  House
//
//  Created by zxf on 2018/6/28.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "GuideViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"

@interface GuideViewController ()
@property(nonatomic,strong)AVPlayer *avPlayer;
@property(nonatomic,strong)AVPlayerLayer *avlayer;
@property (strong, nonatomic)UIButton *jumpButton;

@end

@implementation GuideViewController

-(UIButton *)jumpButton {
    if (!_jumpButton) {
        _jumpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (systemVersion.doubleValue >= 8.0) {
            _jumpButton.frame = CGRectMake(kScreenW-100, 100, 50, 50);
        } else {
            _jumpButton.frame = CGRectMake(kScreenH-100, 100, 50, 50);
        }
        [_jumpButton setTitle:@"跳过" forState: UIControlStateNormal];
        [_jumpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_jumpButton addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:nil];
    NSURL *urlMovie = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"guide" ofType:@"mp4"]];
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:urlMovie options:nil];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    _avPlayer = [AVPlayer playerWithPlayerItem: playerItem];
    _avlayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    
//    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    if (systemVersion.doubleValue >= 8.0) {
        _avlayer.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    } else {
        _avlayer.frame = CGRectMake(0, 0, kScreenH, kScreenW);
    }
   
    _avlayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_avlayer];
    [self.view addSubview:self.jumpButton];
    [self.view bringSubviewToFront:_jumpButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification   object:self.avPlayer.currentItem];
   
    [_avPlayer seekToTime:kCMTimeZero];
    [_avPlayer play];
    
    
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)playbackFinished:(NSNotification *)noti
{
    [self finish];
}


-(void)finish {
    [_avPlayer pause];

    [self.avlayer removeFromSuperlayer];
    self.avlayer=nil;
    self.avPlayer=nil;
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [appDelegate initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
