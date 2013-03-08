//
//  MYIntroductionView.m
//  IntroductionExample
//
//  Created by Matthew York on 3/6/13.
//  Copyright (c) 2013 Matthew York. All rights reserved.
//

#import "MYIntroductionView.h"

#define DEFAULT_BACKGROUND_COLOR [UIColor colorWithWhite:0 alpha:0.9]

@implementation MYIntroductionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initializeClassVariables];
        [self buildUIWithFrame:frame backgroundColor:DEFAULT_BACKGROUND_COLOR];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame headerText:(NSString *)headerText panels:(NSArray *)panels
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initializeClassVariables];
        self.Panels = [panels copy];
        [self buildUIWithFrame:frame backgroundColor:DEFAULT_BACKGROUND_COLOR];
        [self setHeaderText:headerText];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame headerImage:(UIImage *)headerImage panels:(NSArray *)panels
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initializeClassVariables];
        self.Panels = [panels copy];
        [self buildUIWithFrame:frame backgroundColor:DEFAULT_BACKGROUND_COLOR];
        [self setHeaderImage:headerImage];
    }
    return self;
}

-(void)initializeClassVariables{
    panelViews = [[NSMutableArray alloc] init];
}

#pragma mark - UI Builder Methods

-(void)buildUIWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor{
    self.backgroundColor = backgroundColor;
    self.HeaderView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    if (!self.DescriptionFont) {
        self.DescriptionFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0];
    }
    if (!self.DescriptionTextColor) {
         self.DescriptionTextColor = [UIColor whiteColor];
    }
    
    [self buildHeaderViewWithFrame:frame];
    [self buildContentScrollViewWithFrame:frame];
    [self buildFooterView];
}

-(void)buildHeaderViewWithFrame:(CGRect)frame{
    self.HeaderView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width - 10, 60)]; //Leave 5px padding on all sides
    self.HeaderView.backgroundColor = [UIColor clearColor];
    
    //Setup HeaderImageView
    self.HeaderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.HeaderView.frame.size.width, self.HeaderView.frame.size.height)];
    self.HeaderImageView.backgroundColor = [UIColor clearColor];
    [self.HeaderView addSubview:self.HeaderImageView];
    self.HeaderImageView.hidden = YES;
    
    //Setup HeaderLabel
    self.HeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.HeaderView.frame.size.width, self.HeaderView.frame.size.height)];
    self.HeaderLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25.0];
    self.HeaderLabel.textColor = [UIColor whiteColor];
    self.HeaderLabel.backgroundColor = [UIColor clearColor];
    self.HeaderLabel.textAlignment = NSTextAlignmentCenter;
    [self.HeaderView addSubview:self.HeaderLabel];
    self.HeaderLabel.hidden = YES;
    [self addSubview:self.HeaderView];
}

-(void)buildContentScrollViewWithFrame:(CGRect)frame{
    self.ContentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.HeaderView.frame.origin.y + self.HeaderView.frame.size.height + 10, frame.size.width, 0)];
    self.ContentScrollView.pagingEnabled = YES;
    self.ContentScrollView.showsHorizontalScrollIndicator = NO;
    self.ContentScrollView.showsVerticalScrollIndicator = NO;
    self.ContentScrollView.delegate = self;
    
    if (self.Panels) {
        if (self.Panels.count > 0) {
            
            CGFloat contentXIndex = 0;
            for (int ii = 0; ii < self.Panels.count; ii++) {
                [panelViews addObject:[self PanelViewForPanel:self.Panels[ii] atXIndex:&contentXIndex]];
                
                //Make only the first panel visible
                if (ii != 0) {
                    
                }
                [self.ContentScrollView addSubview:panelViews[ii]];
            }
            
            [self makePanelVisibleAtIndex:0];
            [self setContentScrollViewHeightForPanelIndex:0 animated:NO];
            self.ContentScrollView.contentSize = CGSizeMake(contentXIndex, self.ContentScrollView.frame.size.height);
            
            [self addSubview:self.ContentScrollView];
        }
    }
}

-(UIView *)PanelViewForPanel:(MYIntroductionPanel *)panel atXIndex:(CGFloat*)xIndex{
    
    //Build panel now that we have all the desired dimensions
    UIView *panelView = [[UIView alloc] initWithFrame:CGRectMake(*xIndex, 0, self.ContentScrollView.frame.size.width, 0)];
    
    CGFloat maxScrollViewHeight = self.frame.size.height - self.ContentScrollView.frame.origin.y - 44;
    CGFloat imageHeight = MIN(panel.Image.size.height, self.frame.size.width - 10);
    
    //Build text container;
    UITextView *panelTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.ContentScrollView.frame.size.width, 10)];
    panelTextView.scrollEnabled = YES;
    panelTextView.backgroundColor = [UIColor clearColor];
    panelTextView.textAlignment = NSTextAlignmentCenter;
    panelTextView.textColor = self.DescriptionTextColor;
    panelTextView.font = self.DescriptionFont;
    panelTextView.text = panel.Description;
    panelTextView.editable = NO;
    [panelView addSubview:panelTextView];
    
    //Gather a few layout parameters
    NSInteger textHeight = panelTextView.contentSize.height;
    int contentWrappedScrollViewHeight = 0;
    if ((imageHeight+textHeight) > maxScrollViewHeight) {
        contentWrappedScrollViewHeight = maxScrollViewHeight;
        textHeight = contentWrappedScrollViewHeight-imageHeight - 10;
    }
    else if ((imageHeight+textHeight) <= maxScrollViewHeight){
        contentWrappedScrollViewHeight = imageHeight + textHeight;
    }

    panelView.frame = CGRectMake(*xIndex, 0, self.ContentScrollView.frame.size.width, contentWrappedScrollViewHeight);
    
    //Build image container
    UIImageView *panelImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, self.ContentScrollView.frame.size.width - 10, imageHeight)];
    panelImageView.contentMode = UIViewContentModeScaleAspectFit;
    panelImageView.backgroundColor = [UIColor clearColor];
    panelImageView.image = panel.Image;
    panelImageView.layer.cornerRadius = 3;
    panelImageView.clipsToBounds = YES;
    [panelView addSubview:panelImageView];
    
    panelTextView.frame = CGRectMake(0, imageHeight + 5, self.ContentScrollView.frame.size.width, textHeight);
    if (panelTextView.contentSize.height == textHeight) {
        panelTextView.scrollEnabled = NO;
    }
    
    //Update xIndex
    *xIndex += self.ContentScrollView.frame.size.width;
    
    return panelView;
}

-(void)buildFooterView{
    self.PageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((self.frame.size.width - 185)/2, (self.ContentScrollView.frame.origin.y + self.ContentScrollView.frame.size.height + 4), 185, 36)];
    self.PageControl.numberOfPages = self.Panels.count;
    [self addSubview:self.PageControl];
}

-(void)setContentScrollViewHeightForPanelIndex:(NSInteger)panelIndex animated:(BOOL)animated{
    CGFloat newPanelHeight = [panelViews[panelIndex] frame].size.height;
    
    if (animated){
        [UIView animateWithDuration:0.3 animations:^{
            self.ContentScrollView.frame = CGRectMake(self.ContentScrollView.frame.origin.x, self.ContentScrollView.frame.origin.y, self.ContentScrollView.frame.size.width, newPanelHeight);
            self.PageControl.frame = CGRectMake(self.PageControl.frame.origin.x, (self.ContentScrollView.frame.origin.y + self.ContentScrollView.frame.size.height + 4), self.PageControl.frame.size.width, self.PageControl.frame.size.height);
        }];
    }
    else {
        self.ContentScrollView.frame = CGRectMake(self.ContentScrollView.frame.origin.x, self.ContentScrollView.frame.origin.y, self.ContentScrollView.frame.size.width, newPanelHeight);
        
        self.PageControl.frame = CGRectMake(self.PageControl.frame.origin.x, (self.ContentScrollView.frame.origin.y + self.ContentScrollView.frame.size.height + 4), self.PageControl.frame.size.width, self.PageControl.frame.size.height);
        
    }
    
    self.ContentScrollView.contentSize = CGSizeMake(self.ContentScrollView.contentSize.width, newPanelHeight);
    
NSLog(@"content size: %@", NSStringFromCGSize(self.ContentScrollView.contentSize));
}

#pragma mark - Header Content

-(void)setHeaderText:(NSString *)headerText{
    self.HeaderLabel.hidden = NO;
    self.HeaderImageView.hidden = YES;
    self.HeaderLabel.text = headerText;
}

-(void)setHeaderImage:(UIImage *)headerImage {
    self.HeaderLabel.hidden = YES;
    self.HeaderImageView.hidden = NO;
    self.HeaderImageView.image = headerImage;
}

#pragma mark - Show/Hide

-(void)showInView:(UIView *)view{
    //Add introduction view
    self.alpha = 0;
    [view addSubview:self];
    
    //Fade in
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    }];
}

-(void)hide{
    //Fade out
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }];
}

-(void)makePanelVisibleAtIndex:(NSInteger)panelIndex{
    [UIView animateWithDuration:0.3 animations:^{
        for (int ii = 0; ii < panelViews.count; ii++) {
            if (ii == panelIndex) {
                [panelViews[ii] setAlpha:1];
            }
            else {
                [panelViews[ii] setAlpha:0];
            }
        }
    }];
}

#pragma mark - UIScrollView Delegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.CurrentPanelIndex = scrollView.contentOffset.x/self.ContentScrollView.frame.size.width;
    self.PageControl.currentPage = self.CurrentPanelIndex;
    
    [self setContentScrollViewHeightForPanelIndex:self.CurrentPanelIndex animated:YES];
    
    [self makePanelVisibleAtIndex:(NSInteger)self.CurrentPanelIndex];
}

@end
