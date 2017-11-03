//
//  AddScoreAnimationView.h
//  SportChina
//
//  Created by 杨磊 帅™ on 2017/10/19.
//  Copyright © 2017年 Beijing Sino Dance Culture Media Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^voidBlock)(void);

@interface AddScoreAnimationView : UIView<CAAnimationDelegate>
{
    BOOL testHits;
}
@property (nonatomic,  copy)NSArray          *passthroughViews;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

- (void)scoreStartAnimation;//加分
- (void)scoreReduce;//减分
- (void)timeToRight;
- (void)timeToLeft;
- (void)timeType1;//正常
- (void)timeType2;//最后五分钟
- (void)timeType3;

@property (weak, nonatomic) IBOutlet UIView *scoreNewView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scorenewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scoreNewHeight;
@property (weak, nonatomic) IBOutlet UIView *allScoreAniView;
@property (weak, nonatomic) IBOutlet UIImageView *scoreNewArrowView;
@property (weak, nonatomic) IBOutlet UILabel *labelTop;
@property (weak, nonatomic) IBOutlet UILabel *labelCenter;
@property (weak, nonatomic) IBOutlet UILabel *labelBottom;
@property (weak, nonatomic) IBOutlet UIView *timeNewBackView;
@property (weak, nonatomic) IBOutlet UIView *timeNewLayerView;
@property (weak, nonatomic) IBOutlet UILabel *timeNewLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeNewDingView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *timeBackLeftLayout;

@property (weak, nonatomic) IBOutlet UIView *reduceBackView;
@property (weak, nonatomic) IBOutlet UIView *reduceFrontView;

@property (strong,nonatomic)CAKeyframeAnimation *animationReduce;//减分
@property (strong,nonatomic)CAKeyframeAnimation *animation;//加分label
@property (strong,nonatomic)CAKeyframeAnimation *animationRedLabel;//减分label上到中
@property (strong,nonatomic)CAKeyframeAnimation *animationBotRedLabel;//减分label中到下
@property (strong,nonatomic)CAKeyframeAnimation *animationAllScoreLR;//减分结束 总分数左右晃动

@property (strong,nonatomic)CAAnimationGroup *groupsAlpha;//时间呼吸动画
@property (strong,nonatomic)CAAnimationGroup *groupsReduceFront;//减分背景消失

@property (copy  ,nonatomic)voidBlock endBlock;
@property (assign,nonatomic)BOOL isRight;
@property (assign,nonatomic)BOOL isExpend;
@property (copy  ,nonatomic)NSString *clockScore;
@property (copy  ,nonatomic)NSString *allScore;
@property (copy  ,nonatomic)NSString *otherScore;

- (void)bottomClose;
- (void)bottomOpen;
- (void)timeClose;
- (void)timeOpen;
//-----------------这是一条分割线------------

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewBotLayout;
@property (weak, nonatomic) IBOutlet UILabel *botLabel;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIView *botoomBackView;


@end
