//
//  MYIntroductionPanel.m
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

#import "MYIntroductionPanel.h"
#import <QuartzCore/QuartzCore.h>

@implementation MYIntroductionPanel

-(id)initWithimage:(UIImage *)image title:(NSString *)title description:(NSString *)description{
    if (self = [super init]) {
        //Set panel Image
        [self setupPanelContentViewWithImage:image];
        
        self.Title = title;
        
        //Set panel Description
        self.Description = [[NSString alloc] initWithString:description];
    }
    return self;
}

-(id)initWithimage:(UIImage *)image description:(NSString *)description{
    if (self = [super init]) {
        //Set panel Image
        [self setupPanelContentViewWithImage:image];
        
        self.Title = @"";
        
        //Set panel Description
        self.Description = [[NSString alloc] initWithString:description];
    }
    return self;
}

-(id)initWithContentView:(UIView*)view {
    if(self = [super init]) {
        self.PanelContentView = view;
        self.Title = @"";
        self.PanelContentView.clipsToBounds = YES;
    }
    return self;
}

-(void)setupPanelContentViewWithImage:(UIImage*)image {
    self.PanelContentView = [[UIImageView alloc] initWithImage:image];
    self.PanelContentView.contentMode = UIViewContentModeScaleAspectFit;
    self.PanelContentView.backgroundColor = [UIColor clearColor];
    self.PanelContentView.layer.cornerRadius = 3;
    self.PanelContentView.clipsToBounds = YES;
}

@end
