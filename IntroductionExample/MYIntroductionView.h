//
//  MYIntroductionView.h
//  IntroductionExample
//
//  Created by Matthew York on 3/6/13.
//  Copyright (c) 2013 Matthew York. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYIntroductionPanel.h"
#import <QuartzCore/QuartzCore.h>

@interface MYIntroductionView : UIView <UIScrollViewDelegate>{
    NSMutableArray *panelViews;
    
}

@property (nonatomic, retain) NSArray *Panels;

@property (nonatomic, assign) NSInteger CurrentPanelIndex;

//Header properties
@property(nonatomic, retain) UILabel *HeaderLabel;
@property(nonatomic, retain) UIImageView *HeaderImageView;
@property(nonatomic, retain) UIView *HeaderView;

//Content properties
@property(nonatomic, retain) UIScrollView *ContentScrollView;
@property (nonatomic, retain) UIFont *DescriptionFont;
@property (nonatomic, retain) UIColor *DescriptionTextColor;

//PageControl/Skip Button
@property(nonatomic, retain) UIPageControl *PageControl;

//Custom Init Methods
- (id)initWithFrame:(CGRect)frame headerText:(NSString *)headerText panels:(NSArray *)panels;
- (id)initWithFrame:(CGRect)frame headerImage:(UIImage *)headerImage panels:(NSArray *)panels;

//Header Content
-(void)setHeaderText:(NSString *)headerText;
-(void)setHeaderImage:(UIImage *)headerImage;

//Show/Hide
-(void)showInView:(UIView *)view;
-(void)hide;

@end
