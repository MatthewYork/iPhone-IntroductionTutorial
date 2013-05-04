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
MYFinishTypeSwipeOut = 0,
    MYFinishTypeSkipButton
}MYFinishType;

typedef enum {
    MYLanguageDirectionLeftToRight = 0,
    MYLanguageDirectionRightToLeft
}MYLanguageDirection;

/******************************/
//Delegate Method Declarations
/******************************/
@protocol MYIntroductionDelegate
@optional
-(void)introductionDidFinishWithType:(MYFinishType)finishType;
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
    
    //Variable keeping track of language direction
    MYLanguageDirection LanguageDirection;
}


/******************************/
//Properties
/******************************/

//Delegate
@property (weak) id <MYIntroductionDelegate> delegate;

//Panel management
@property (nonatomic, assign) NSInteger CurrentPanelIndex;

//Intoduction Properties
@property (nonatomic, retain) UIImageView *BackgroundImageView;

//Header properties
@property (nonatomic, retain) UILabel *HeaderLabel;
@property (nonatomic, retain) UIImageView *HeaderImageView;
@property (nonatomic, retain) UIView *HeaderView;

//Content properties
@property (nonatomic, retain) UIScrollView *ContentScrollView;

//PageControl/Skip Button
@property (nonatomic, retain) UIPageControl *PageControl;
@property (nonatomic, retain) UIButton *SkipButton;

//Nuts & Bolts
@property BOOL device;
@property BOOL device_orientation;


/******************************/
//Methods
/******************************/

//Custom Init Methods
- (id)initWithFrame:(CGRect)frame headerText:(NSString *)headerText panels:(NSArray *)panels;
- (id)initWithFrame:(CGRect)frame headerImage:(UIImage *)headerImage panels:(NSArray *)panels;
- (id)initWithFrame:(CGRect)frame headerText:(NSString *)headerText panels:(NSArray *)panels languageDirection:(MYLanguageDirection)languageDirection;
- (id)initWithFrame:(CGRect)frame headerImage:(UIImage *)headerImage panels:(NSArray *)panels languageDirection:(MYLanguageDirection)languageDirection;
- (id)initWithFrame:(CGRect)frame panels:(NSArray *)panels;
- (id)initWithFrame:(CGRect)frame panels:(NSArray *)panels languageDirection:(MYLanguageDirection)languageDirection;

//Header Content
-(void)setHeaderText:(NSString *)headerText;
-(void)setHeaderImage:(UIImage *)headerImage;

//Introduction Content
-(void)setBackgroundImage:(UIImage *)backgroundImage;
-(void)setBackgroundColor:(UIColor *)backgroundColor;

//Show/Hide
-(void)showInView:(UIView *)view animateDuration:(CGFloat)duration;
-(void)hideWithFadeOutDuration:(CGFloat)duration;


@end
