//
//  ViewController.m
//  AddAndReduceDemo
//
//  Created by 杨磊 帅™ on 2017/11/3.
//  Copyright © 2017年 csda_Chinadance. All rights reserved.
//

#import "ViewController.h"
#import "AddScoreAnimationView.h"
@interface ViewController ()
@property (nonatomic,strong) AddScoreAnimationView  *addScoreAnimationView;//分数
@property (nonatomic,strong) NSTimer                *timer;//计时器
@property (nonatomic,assign) NSInteger              secondsCountDown; //计时器的时间数
@property (nonatomic,assign) NSInteger              limit_time;//限制时间
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *reducebtn;


@end

@implementation ViewController
- (IBAction)add:(id)sender {
    NSInteger allNum = arc4random()%20 + 5;
    self.addScoreAnimationView.scoreLabel.text = [NSString stringWithFormat:@"-%ld分",allNum];
    [self.addScoreAnimationView scoreReduce];
}
- (IBAction)reduce:(id)sender {
    NSInteger allNum = arc4random()%50 + 10;
    self.addScoreAnimationView.scoreLabel.text = [NSString stringWithFormat:@"+%ld",allNum];
    [self.addScoreAnimationView scoreStartAnimation];
}
- (IBAction)set:(id)sender {
    [self.addScoreAnimationView bottomOpen];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.limit_time = 10;
    [self loadTimer];
    [self scoreView];
}
- (void)scoreView
{
    __weak __typeof__(self) weakSelf = self;
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"AddScoreAnimationView" owner:nil options:nil];
    self.addScoreAnimationView = views[0];
    [self setAllScore];
    self.addScoreAnimationView.passthroughViews = @[self.view];
    [self.view addSubview:self.addScoreAnimationView];

    self.addScoreAnimationView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.addScoreAnimationView.endBlock = ^{
        [weakSelf setAllScore];
    };
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.addScoreAnimationView.isExpend = NO;
        [self.addScoreAnimationView timeClose];
    });
}
- (void)setAllScore{
    self.addScoreAnimationView.allScore   = @"120";
    self.addScoreAnimationView.clockScore = @"50";
    self.addScoreAnimationView.otherScore = @"70";
}

- (void)loadTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer  forMode:NSRunLoopCommonModes];
}

- (void)timeFireMethod
{
        self.secondsCountDown ++;
        if (self.secondsCountDown < self.limit_time)
        {
            self.addScoreAnimationView.timeNewLabel.text = [NSString stringWithFormat:@"%@",[self timeFormattedShort:self.limit_time - self.secondsCountDown]];
            if (self.limit_time - self.secondsCountDown  <= 5)
            {
                [self.addScoreAnimationView timeType2];
            }else
            {
                [self.addScoreAnimationView timeType1];
            }
        }else if (self.secondsCountDown == self.limit_time)
        {
            self.addScoreAnimationView.timeNewLabel.text = @"00:00";
            self.addScoreAnimationView.scoreLabel.text = @"-5";
            [self.addScoreAnimationView scoreReduce];
            [self.addScoreAnimationView timeType3];
            
        }else
        {
            [self.addScoreAnimationView timeType3];
            self.addScoreAnimationView.timeNewLabel.text = [NSString stringWithFormat:@"%@",[self timeFormattedShort:self.secondsCountDown - self.limit_time]];
            
            if ((self.secondsCountDown - self.limit_time)%60 == 0)
            {//动画
                self.addScoreAnimationView.scoreLabel.text = @"-5";
                [self.addScoreAnimationView scoreReduce];
            }
        }
}

- (NSString *)timeFormattedShort:(NSInteger)totalSeconds
{
    NSInteger seconds = totalSeconds % 60;
    NSInteger minutes = (totalSeconds / 60) % 60;
    NSInteger hours = totalSeconds / 3600;
    if (hours == 0)
    {
        return [NSString stringWithFormat:@"%02ld:%02ld", minutes, seconds];
    }else
    {
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",hours, minutes, seconds];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
