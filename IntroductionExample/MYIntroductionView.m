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
        [self buildUIWithFrame:frame backgroundColor:DEFAULT_BACKGROUND_COLOR];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame headerText:(NSString *)headerText panels:(NSArray *)panels
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
        self.Panels = [panels copy];
        [self buildUIWithFrame:frame backgroundColor:DEFAULT_BACKGROUND_COLOR];
        [self setHeaderImage:headerImage];
    }
    return self;
}

#pragma mark - UI Builder Methods

-(void)buildUIWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor{
    self.backgroundColor = backgroundColor;
    self.HeaderView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    
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
    
    if (self.Panels) {
        if (self.Panels.count > 0) {
            self.ContentScrollView.backgroundColor = [UIColor greenColor];
            
            
            
            [self addSubview:self.ContentScrollView];
        }
    }
}

-(CGFloat)ContentScrollViewSizeForPanel:(MYIntroductionPanel *)panel{
    CGFloat imageHeight = panel.Image.size.height;
    CGFloat textHeight = [panel.Description sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0] constrainedToSize:CGSizeMake(self.ContentScrollView.frame.size.width,1000) lineBreakMode:NSLineBreakByWordWrapping].height;
    
    if ((imageHeight+textHeight) > (self.frame.size.height - self.ContentScrollView.frame.origin.y - 44)) {
        return self.frame.size.height - self.ContentScrollView.frame.origin.y - 44;
    }
    return imageHeight + textHeight;
}

-(void)buildFooterView{
    self.PageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((self.frame.size.width - 185)/2, (self.ContentScrollView.frame.origin.y + self.ContentScrollView.frame.size.height + 4), 185, 36)];
    self.PageControl.numberOfPages = 4; //self.Panels.count;
    [self addSubview:self.PageControl];
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

@end
