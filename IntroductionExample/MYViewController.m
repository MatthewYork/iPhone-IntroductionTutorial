//
//  MYViewController.m
//  IntroductionExample
//
//  Created by Matthew York on 3/6/13.
//  Copyright (c) 2013 Matthew York. All rights reserved.
//

#import "MYViewController.h"
#import "MYIntroductionView.h"

@interface MYViewController ()

@end

@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    MYIntroductionPanel *panel = [[MYIntroductionPanel alloc] initWithimage:[UIImage imageNamed:@"TutorialBustedMenu"] description:@"asd asd a sdfffdasfas fasd fasdf sd fsdfdsfasd asdfdfsdfa asd fdsffdsfa  asdf asdffds asd adfsdfdfasf df"];
    
    MYIntroductionPanel *panel2 = [[MYIntroductionPanel alloc] initWithimage:[UIImage imageNamed:@"TutorialLeftMenu"] description:@"asd asd a sdfffdasfas fasd fasdf sd fsdfdsfasd asdfdfsdfa asd fdsffdsfa  asdf asdffds asd adfsdfd fasf df aljdsfljasdlkfj laksjdfl sljd flajsdjjd sfkjd kkdfkj dkjfj asd asdfasdf  asd s s asasdff dsdafdfa asdfss sddds a s ddsafdasdf asd sd as sdadsad  asdsds a sdfssfd"];
    
    MYIntroductionView *introductionView = [[MYIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) headerImage:[UIImage imageNamed:@"SampleHeaderImage.png"] panels:@[panel, panel2]];
    
    //MYIntroductionView *introductionView = [[MYIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) headerText:@"Your Application Name" panels:@[panel, panel2]];
    
    
    [introductionView showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
