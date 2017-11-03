//
//  AddScoreAnimationView.m
//  SportChina
//
//  Created by 杨磊 帅™ on 2017/10/19.
//  Copyright © 2017年 Beijing Sino Dance Culture Media Co.,Ltd. All rights reserved.
//

#import "AddScoreAnimationView.h"
#import "YSWaterWaveView.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(1.f)]
@implementation AddScoreAnimationView
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.timeNewLabel.adjustsFontSizeToFitWidth = YES;
    
    self.scoreNewView.layer.borderWidth = 2;
    self.scoreNewView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.timeNewBackView.layer.borderWidth = 2;
    [self timeType1];
    
    UITapGestureRecognizer *tapBotBack = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressBotBack)];
    [self.botoomBackView addGestureRecognizer:tapBotBack];
    
    UITapGestureRecognizer *tapScore = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressScore)];
    self.scoreNewView.userInteractionEnabled = YES;
    [self.scoreNewView addGestureRecognizer:tapScore];
    
    NSString *str1 = @"0";
    NSString *allStr = [NSString stringWithFormat:@"%@\n总积分",str1];
    NSMutableAttributedString *attibuted = [[NSMutableAttributedString alloc]initWithString:allStr];
    NSRange rangeCount1 = NSMakeRange([[attibuted string] rangeOfString:str1].location, [[attibuted string] rangeOfString:str1].length);
    [attibuted addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0] range:rangeCount1];
    [self.labelTop setAttributedText:attibuted];
    
    NSString *str2 = @"0";
    NSString *allStr2 = [NSString stringWithFormat:@"%@\n点标",str2];
    NSMutableAttributedString *attibuted2 = [[NSMutableAttributedString alloc]initWithString:allStr2];
    NSRange rangeCount2 = NSMakeRange([[attibuted2 string] rangeOfString:str2].location, [[attibuted2 string] rangeOfString:str2].length);
    [attibuted2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0] range:rangeCount2];
    
    [self.labelCenter setAttributedText:attibuted2];
    
    NSString *str3 = @"0";
    NSString *allStr3 = [NSString stringWithFormat:@"%@\n其它",str3];
    NSMutableAttributedString *attibuted3 = [[NSMutableAttributedString alloc]initWithString:allStr3];
    NSRange rangeCount3 = NSMakeRange([[attibuted3 string] rangeOfString:str3].location, [[attibuted3 string] rangeOfString:str3].length);
    [attibuted3 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0] range:rangeCount3];
    
    [self.labelBottom setAttributedText:attibuted3];
    
    self.isExpend = YES;
    [self timeOpen];
}
#pragma mark - 时间的动画
- (void)timeToRight
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.timeBackLeftLayout.constant = 81;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}
- (void)timeToLeft
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.timeBackLeftLayout.constant = 68;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}
#pragma mark - 点击展开
- (void)pressScore
{
    if (!self.isExpend)
    {//展开动画
        [self timeOpen];
    }else
    {
        [self timeClose];
    }
    self.isExpend = !self.isExpend;
}

- (void)timeOpen
{
    [UIView animateWithDuration:0.2 animations:^{
        self.scoreNewHeight.constant = 175;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.scoreNewArrowView.image = [UIImage imageNamed:@"running_custombar_sanjiaotop"];
    }];
    [self timeToRight];
}

- (void)timeClose
{
    [UIView animateWithDuration:0.2 animations:^{
        self.scoreNewHeight.constant = 66;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.scoreNewArrowView.image = [UIImage imageNamed:@"running_custombar_sanjiaobot"];
    }];
    [self timeToLeft];
}
#pragma mark - 赋值
- (void)setOtherScore:(NSString *)otherScore
{
    _otherScore = otherScore;
    
    NSString *str1 = self.allScore;
    NSString *allStr = [NSString stringWithFormat:@"%@\n总积分",str1];
    NSMutableAttributedString *attibuted = [[NSMutableAttributedString alloc]initWithString:allStr];
    NSRange rangeCount1 = NSMakeRange([[attibuted string] rangeOfString:str1].location, [[attibuted string] rangeOfString:str1].length);
    [attibuted addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0] range:rangeCount1];
    
    [self.labelTop setAttributedText:attibuted];
    
    
    NSString *str2 = self.clockScore;
    NSString *allStr2 = [NSString stringWithFormat:@"%@\n点标",str2];
    NSMutableAttributedString *attibuted2 = [[NSMutableAttributedString alloc]initWithString:allStr2];
    NSRange rangeCount2 = NSMakeRange([[attibuted2 string] rangeOfString:str2].location, [[attibuted2 string] rangeOfString:str2].length);
    [attibuted2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0] range:rangeCount2];
    
    [self.labelCenter setAttributedText:attibuted2];
    
    NSString *str3 = _otherScore;
    NSString *allStr3 = [NSString stringWithFormat:@"%@\n其它",str3];
    NSMutableAttributedString *attibuted3 = [[NSMutableAttributedString alloc]initWithString:allStr3];
    NSRange rangeCount3 = NSMakeRange([[attibuted3 string] rangeOfString:str3].location, [[attibuted3 string] rangeOfString:str3].length);
    [attibuted3 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0] range:rangeCount3];
    
    [self.labelBottom setAttributedText:attibuted3];
}

#pragma mark - 动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [self.scoreLabel.layer animationForKey:@"animationOpacity"])
    {//加分
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.4 animations:^{
                self.allScoreAniView.alpha = 0;
            } completion:^(BOOL finished) {
                self.scoreLabel.hidden = YES;
                self.scoreNewView.userInteractionEnabled = YES;
                self.allScoreAniView.alpha = 1;
                for (id view in self.allScoreAniView.subviews)
                {
                    [view removeFromSuperview];
                }
            }];
        });
        if (self.endBlock) {
            self.endBlock();
        }
    }else if (anim == [self.scoreLabel.layer animationForKey:@"animationRedLabel"])
    {//减分的分数动画结束
        self.scoreLabel.hidden = YES;
        [self.reduceFrontView.layer addAnimation:self.groupsReduceFront forKey:nil];
    }
    else if (anim == [self.reduceBackView.layer animationForKey:@"animationBotRedLabel"])
    {//减分结束 总分左右晃动
        self.reduceFrontView.hidden = YES;
        self.reduceBackView.hidden = YES;
        [self.labelTop.layer addAnimation:self.animationAllScoreLR forKey:@"animationAllScoreLR"];
    }
}
#pragma mark - 减分
- (void)scoreReduce
{
    self.isExpend = NO;
    [self timeClose];
    self.reduceFrontView.hidden = NO;
    self.reduceBackView.hidden = NO;

    [self.reduceBackView.layer addAnimation:self.animationReduce forKey:@"reduceBackView"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.22 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.reduceFrontView.layer addAnimation:self.animationReduce forKey:@"reduceFrontView"];
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.scoreLabel.hidden = NO;
        [self.scoreLabel.layer addAnimation:self.animationRedLabel forKey:@"animationRedLabel"];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.reduceBackView.layer addAnimation:self.animationBotRedLabel forKey:@"animationBotRedLabel"];
        
    });
}
#pragma mark - 加分
- (void)scoreStartAnimation
{
    self.scoreNewView.userInteractionEnabled = NO;
    self.isExpend = NO;
    [self timeClose];

    for (id view in self.allScoreAniView.subviews)
    {
        [view removeFromSuperview];
    }
    UIColor *color1 = [UIColor colorWithRed:150/255.0f green:186/255.0f blue:247/255.0f alpha:1];
    UIColor *color2 = [UIColor colorWithRed:110/255.0f green:152/255.0f blue:230/255.0f alpha:1];
    UIColor *color3 = [UIColor colorWithRed:195/255.0f green:218/255.0f blue:253/255.0f alpha:1];
    UIColor *color4 = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    [self addLayer:@[color1,color1] setTransform:-M_PI/8 withSpeed:4];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addLayer:@[color2,color2] setTransform:M_PI/4 withSpeed:4];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.scoreLabel.hidden = NO;
        [self.scoreLabel.layer addAnimation:self.animation forKey:@"animationOpacity"];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addLayer:@[color3,color3] setTransform:-M_PI/8 withSpeed:3];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addLayer:@[color4,color4] setTransform:M_PI/4 withSpeed:4];
    });
}

- (void)addLayer:(NSArray *)array setTransform:(float)transform withSpeed:(float)speed
{
    YSWaterWaveView *waterWaveView = [[YSWaterWaveView alloc] initWithFrame:self.allScoreAniView.bounds];
    waterWaveView.backgroundColor = [UIColor clearColor];
    [waterWaveView setGradientColors:array];
    [waterWaveView startWaveToPercent:1];
    [waterWaveView setGrowthSpeed:speed];
    
    waterWaveView.layer.cornerRadius = self.allScoreAniView.bounds.size.width / 2;
    waterWaveView.clipsToBounds = YES;
    
    [self.allScoreAniView addSubview:waterWaveView];
    
    [waterWaveView setTransform:CGAffineTransformMakeRotation(transform)];

}

#pragma mark - 时间
- (void)timeType1
{
    self.timeNewBackView.layer.borderColor = [UIColor whiteColor].CGColor;

    self.timeNewBackView.backgroundColor = [self getColor:@"4A90E2"];
    self.timeNewLayerView.backgroundColor = [self getColor:@"FFFFFF"];
    self.timeNewLabel.textColor = [self getColor:@"4A90E2"];
    self.timeNewDingView.textColor = [self getColor:@"4A90E2"];
    
    self.timeNewDingView.text = @"倒计时";
}
- (void)timeType2
{
    self.timeNewBackView.layer.borderColor = [UIColor whiteColor].CGColor;

    self.timeNewBackView.backgroundColor = [self getColor:@"4A90E2"];
    self.timeNewLayerView.backgroundColor = [self getColor:@"FFFFFF"];
    self.timeNewLabel.textColor =[self getColor:@"fa5858"];
    self.timeNewDingView.textColor = [self getColor:@"4A90E2"];

    [self.timeNewLabel.layer addAnimation:self.groupsAlpha forKey:@"aAlpha"];
    self.timeNewDingView.text = @"倒计时";
}
- (void)timeType3
{
    [self.timeNewLabel.layer removeAllAnimations];
    self.timeNewBackView.layer.borderColor = RGBCOLOR(195, 46, 47).CGColor;

    self.timeNewBackView.backgroundColor = [UIColor redColor];
    self.timeNewLayerView.backgroundColor = [UIColor clearColor];
    self.timeNewLabel.textColor = [self getColor:@"FFFFFF"];
    self.timeNewDingView.textColor = [self getColor:@"FFFFFF"];
    self.timeNewDingView.text = @"超时";

}

- (CAKeyframeAnimation *)animation
{//加分label
    if (_animation == nil) {
        NSValue *orginalValue = [NSValue valueWithCGPoint:CGPointMake(33,76)];
        NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(33,33)];
        NSValue *value_2 = [NSValue valueWithCGPoint:CGPointMake(33,33)];
        NSValue *value_3 = [NSValue valueWithCGPoint:CGPointMake(33,-10)];
        _animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        _animation.keyTimes = @[@(0.0),@(0.2),@(0.8),@(1.0)];
        _animation.values = @[orginalValue,value_1,value_2,value_3];
        _animation.duration = 1.2f;
        _animation.repeatCount = 1;
        _animation.removedOnCompletion = NO;
        _animation.fillMode = kCAFillModeForwards;
        _animation.delegate = self;
        [_animation setValue:@"animationOpacity" forKey:@"animType"];
    }
    return _animation;
}

- (CAKeyframeAnimation *)animationRedLabel
{//减分label
    if (_animationRedLabel == nil) {
        NSValue *orginalValue = [NSValue valueWithCGPoint:CGPointMake(33,-10)];
        NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(33,33)];
        NSValue *value_2 = [NSValue valueWithCGPoint:CGPointMake(33,33)];
        NSValue *value_3 = [NSValue valueWithCGPoint:CGPointMake(33,76)];
        _animationRedLabel = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        _animationRedLabel.keyTimes = @[@(0.0),@(0.15),@(0.85),@(1.0)];
        _animationRedLabel.values = @[orginalValue,value_1,value_2,value_3];
        _animationRedLabel.duration = 1.4f;
        _animationRedLabel.repeatCount = 1;
        _animationRedLabel.removedOnCompletion = NO;
        _animationRedLabel.fillMode = kCAFillModeForwards;
        _animationRedLabel.delegate = self;
        [_animationRedLabel setValue:@"animationRedLabel" forKey:@"animType"];
    }
    return _animationRedLabel;
}

- (CAAnimationGroup *)groupsAlpha{
    if (!_groupsAlpha) {
        // 缩放动画
        CABasicAnimation * scaleAnim = [CABasicAnimation animation];
        scaleAnim.keyPath = @"transform.scale";
        scaleAnim.fromValue = @1;
        scaleAnim.toValue = @1.15;
        scaleAnim.duration = 1;

        _groupsAlpha =[CAAnimationGroup animation];
        _groupsAlpha.animations = @[scaleAnim];
        _groupsAlpha.removedOnCompletion = NO;
        _groupsAlpha.fillMode = kCAFillModeForwards;
        _groupsAlpha.duration = 1;
        _groupsAlpha.autoreverses = YES;
        _groupsAlpha.repeatCount = FLT_MAX;
    }
    return _groupsAlpha;
}

- (CAAnimationGroup *)groupsReduceFront{
    if (!_groupsReduceFront) {
        NSValue *orginalValue = [NSValue valueWithCGPoint:CGPointMake(29,29)];
        NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(29,58 + 29)];
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        animation.keyTimes = @[@(0.0),@(1.0)];
        animation.values = @[orginalValue,value_1];
        animation.duration = 0.1f;
        animation.repeatCount = 1;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        
        CABasicAnimation *showViewAnn = [CABasicAnimation animationWithKeyPath:@"opacity"];
        showViewAnn.fromValue = [NSNumber numberWithFloat:0.0];
        showViewAnn.toValue = [NSNumber numberWithFloat:1.0];
        showViewAnn.duration = 0.1f;
        showViewAnn.repeatCount = 1;
        showViewAnn.fillMode = kCAFillModeForwards;
        showViewAnn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        showViewAnn.removedOnCompletion = NO;
        
        _groupsReduceFront =[CAAnimationGroup animation];
        _groupsReduceFront.animations = @[animation,showViewAnn];
        _groupsReduceFront.removedOnCompletion = NO;
        _groupsReduceFront.duration = 0.1f;
        _groupsReduceFront.repeatCount = 1;
        _groupsReduceFront.removedOnCompletion = NO;
        _groupsReduceFront.fillMode = kCAFillModeForwards;
    }
    return _groupsReduceFront;
}

- (CAKeyframeAnimation *)animationReduce
{//减分上到中
    if (_animationReduce == nil) {
        NSValue *orginalValue = [NSValue valueWithCGPoint:CGPointMake(29,-58)];
        NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(29,29)];
        _animationReduce = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        _animationReduce.keyTimes = @[@(0.0),@(1.0)];
        _animationReduce.values = @[orginalValue,value_1];
        _animationReduce.duration = 0.23f;
        _animationReduce.repeatCount = 1;
        _animationReduce.removedOnCompletion = NO;
        _animationReduce.fillMode = kCAFillModeForwards;
    }
    return _animationReduce;
}

- (CAKeyframeAnimation *)animationBotRedLabel
{//减分中到下
    if (_animationBotRedLabel == nil) {
        NSValue *orginalValue = [NSValue valueWithCGPoint:CGPointMake(29,29)];
        NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(29,58 + 29)];
        _animationBotRedLabel = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        _animationBotRedLabel.keyTimes = @[@(0.0),@(1.0)];
        _animationBotRedLabel.values = @[orginalValue,value_1];
        _animationBotRedLabel.duration = 0.25f;
        _animationBotRedLabel.repeatCount = 1;
        _animationBotRedLabel.removedOnCompletion = NO;
        _animationBotRedLabel.delegate = self;
        _animationBotRedLabel.fillMode = kCAFillModeForwards;
    }
    return _animationBotRedLabel;
}

- (CAKeyframeAnimation *)animationAllScoreLR
{//减分结束 总分数左右晃动
    if (_animationAllScoreLR == nil) {
        float lrEdge = 2;
        NSValue *orginalValue = [NSValue valueWithCGPoint:CGPointMake(29,22)];
        NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(29-lrEdge,22)];
        NSValue *value_2 = [NSValue valueWithCGPoint:CGPointMake(29,22)];
        NSValue *value_3 = [NSValue valueWithCGPoint:CGPointMake(29+lrEdge,22)];
        NSValue *value_4 = [NSValue valueWithCGPoint:CGPointMake(29,22)];

        _animationAllScoreLR = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        _animationAllScoreLR.keyTimes = @[@(0.0),@(0.3),@(0.5),@(0.8),@(1.0)];
        _animationAllScoreLR.values   = @[orginalValue,value_1,value_2,value_3,value_4];
        _animationAllScoreLR.duration = 0.23f;
        _animationAllScoreLR.repeatCount = 2;
        _animationAllScoreLR.removedOnCompletion = NO;
        _animationAllScoreLR.fillMode = kCAFillModeForwards;
    }
    return _animationAllScoreLR;
}

- (IBAction)close:(id)sender {
    if (self.bottomViewBotLayout.constant == 0)
    {//关闭
        [self bottomClose];
    }else
    {//展开
        [self bottomOpen];
    }
}
- (void)pressBotBack
{
    if (self.bottomViewBotLayout.constant == 0)
    {//关闭
        [self bottomClose];
    }else
    {//展开
        [self bottomOpen];
    }
}
- (void)bottomClose
{
    self.bottomViewBotLayout.constant = 0;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.bottomViewBotLayout.constant = -203;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.botoomBackView.backgroundColor = [UIColor clearColor];
        self.botoomBackView.hidden = YES;
    }];
}
- (void)bottomOpen
{
    self.botoomBackView.hidden = NO;
    self.bottomViewBotLayout.constant = -203;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.bottomViewBotLayout.constant = 0;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.botoomBackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }];
}

// 16进制颜色
- (UIColor *)getColor:(NSString*)hexColor {
    if([hexColor hasPrefix:@"#"]) {
        hexColor = [hexColor substringFromIndex:1];
    }
    
    NSScanner*scanner = [NSScanner scannerWithString:hexColor];
    unsigned hexNum;
    if(![scanner scanHexInt:&hexNum]) {
        return nil;
    }
    return [[self class] colorWithRGBHex:hexNum];
}
+ (UIColor *)colorWithRGBHex:(UInt32)hex{
    int r = (hex >>16) &0xFF;
    int g = (hex >>8) &0xFF;
    int b = (hex) &0xFF;
    return[UIColor colorWithRed:r /255.0f
                          green:g /255.0f
                           blue:b /255.0f
                          alpha:1.0f];
}
#pragma mark - 穿透view
-(UIView*) hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if(testHits)
    {
        return nil;
    }
    if(!self.passthroughViews || (self.passthroughViews && self.passthroughViews.count == 0))
    {
        return self;
    } else {
        UIView *hitView = [super hitTest:point withEvent:event];
        if (hitView == self) {
            testHits = YES;
            CGPoint superPoint = [self.superview convertPoint:point fromView:self];
            UIView *superHitView = [self.superview hitTest:superPoint withEvent:event];
            testHits = NO;
            if ([self isPassthroughView:superHitView])
            {
                hitView = superHitView;
            }
        }
        return hitView;
    }
}

- (BOOL)isPassthroughView:(UIView *)view
{
    if (view == nil)
    {
        return NO;
    }
    if ([self.passthroughViews containsObject:view])
    {
        return YES;
    }
    return [self isPassthroughView:view.superview];
}
@end
