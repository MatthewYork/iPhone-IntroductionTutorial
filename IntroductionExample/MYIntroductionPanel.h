//
//  MYIntroductionPanel.h
//  IntroductionExample
//
//  Created by Matthew York on 3/6/13.
//  Copyright (c) 2013 Matthew York. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYIntroductionPanel : NSObject {
    UIImage *Image;
    NSString *Description;
}

-(id)initWithimage:(UIImage *)image description:(NSString *)description;

@end
