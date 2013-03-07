//
//  MYIntroductionPanel.m
//  IntroductionExample
//
//  Created by Matthew York on 3/6/13.
//  Copyright (c) 2013 Matthew York. All rights reserved.
//

#import "MYIntroductionPanel.h"

@implementation MYIntroductionPanel

-(id)initWithimage:(UIImage *)image description:(NSString *)description{
    if (self = [super init]) {
        //Set panel Image
        self.Image = [[UIImage alloc] init];
        self.Image = image;
        
        //Set panel Description
        self.Description = [[NSString alloc] initWithString:description];
    }
    
    return self;
}
@end
