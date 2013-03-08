//
//  MYIntroductionView.h
//  IntroductionExample
//
//  Copyright (C) 2013, Matt York
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import <UIKit/UIKit.h>
#import "MYIntroductionPanel.h"
#import <QuartzCore/QuartzCore.h>

typedef enum {
FinishTypeSwipeOut = 0,
    FinishTypeSkipButton
}FinishType;

/******************************/
//Delegate Method Declarations
/******************************/
@protocol MYIntroductionDelegate
@optional
-(void)introductionDidFinishWithType:(FinishType)finishType;
-(void)introductionDidChangeToPanel:(MYIntroductionPanel *)panel withIndex:(NSInteger)panelIndex;
@end


/******************************/
//MYIntroductionView
/******************************/
@interface MYIntroductionView : UIView <UIScrollViewDelegate>{
    
    //Array of panel objects passed in at initialization
    NSArray *Panels;
    
    //Array of views created by MYIntroductionController from MYIntroductionPanel objects. For internal use only.
    NSMutableArray *panelViews;
    
    //Keeps track of the index of the last panel navigated to. For internal use only.
    NSInteger LastPanelIndex;
}

//Delegate
@property (weak) id <MYIntroductionDelegate> delegate;

//Panel management
@property (nonatomic, assign) NSInteger CurrentPanelIndex;

//Header properties
@property (nonatomic, retain) UILabel *HeaderLabel;
@property (nonatomic, retain) UIImageView *HeaderImageView;
@property (nonatomic, retain) UIView *HeaderView;

//Content properties
@property (nonatomic, retain) UIScrollView *ContentScrollView;
@property (nonatomic, retain) UIFont *DescriptionFont;
@property (nonatomic, retain) UIColor *DescriptionTextColor;

//PageControl/Skip Button
@property (nonatomic, retain) UIPageControl *PageControl;
@property (nonatomic, retain) UIButton *SkipButton;

//Custom Init Methods
- (id)initWithFrame:(CGRect)frame headerText:(NSString *)headerText panels:(NSArray *)panels;
- (id)initWithFrame:(CGRect)frame headerImage:(UIImage *)headerImage panels:(NSArray *)panels;

//Header Content
-(void)setHeaderText:(NSString *)headerText;
-(void)setHeaderImage:(UIImage *)headerImage;

//Show/Hide
-(void)showInView:(UIView *)view;
-(void)hideWithFadeOutDuration:(CGFloat)duration;

@end
