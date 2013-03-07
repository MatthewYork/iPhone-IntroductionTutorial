//
//  MYIntroductionView.h
//  IntroductionExample
//
//  Created by Matthew York on 3/6/13.
//  Copyright (c) 2013 Matthew York. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYIntroductionPanel.h"

@interface MYIntroductionView : UIView {
    
}

@property (nonatomic, retain) NSArray *Panels;

@property(nonatomic, retain) UILabel *HeaderLabel;
@property(nonatomic, retain) UIImageView *HeaderImageView;
@property(nonatomic, retain) UIView *HeaderView;

@property(nonatomic, retain) UIScrollView *ContentScrollView;

//Custom Init Methods
- (id)initWithFrame:(CGRect)frame headerText:(NSString *)headerText;
- (id)initWithFrame:(CGRect)frame headerImage:(UIImage *)headerImage;

//Header Content
-(void)setHeaderText:(NSString *)headerText;
-(void)setHeaderImage:(UIImage *)headerImage;

//Show/Hide
-(void)showInView:(UIView *)view;
-(void)hide;

@end
