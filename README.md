iPhone-App-Introduction-Tutorial
================================

A "drop-in" solution for building stylish app introductions and tutorials.


Requirements
========================

This project requires ARC and the QuartzCore framework


Installation
========================

- Add the QuartzCore framework by clicking on your Project File -> Build Phases -> Lnk Binary With Libraries
- Add `MYIntroductionView.h` and `MYIntroductionView.m` to your project.
- Add `MYIntroductionPanel.h` and `MYIntroductionPanel.m` to your project.
- `#import "MYIntroductionView.h"` to use it in a class
- Subscribe to the 'MYIntroductionDelegate' to enable delegate/callback interaction.


Sample Images
========================

![BackgroundImage](http://img221.imageshack.us/img221/8606/iossimulatorscreenshotm.png)      ![NoBackgroundImage](http://img32.imageshack.us/img32/8606/iossimulatorscreenshotm.png)


How To Use It?
========================

Step 1 - Build Panels
------------------------
The introduction view needs something to display, and these are done via panels. Each panel holds an image and some description text. To create a panel, simply call the `initWithImage:description:` method. Two examples may be seen below;

    MYIntroductionPanel *panel = [[MYIntroductionPanel alloc] initWithimage:[UIImage imageNamed:@"SampleImage1"] description:@"asd asd a sdfffdasfas fasd fasdf sd fsdfdsfasd asdfdfsdfa asd fdsffdsfa  asdf asdffds asd adfsdfdfasf df"];
  
    MYIntroductionPanel *panel2 = [[MYIntroductionPanel alloc] initWithimage:[UIImage imageNamed:@"SampleImage2"] description:@"asd asd a sdfffdasfas fasd fasdf sd fsdfdsfasd asdfdfsdfa asd fdsffdsfa  asdf asdffds asd adfsdfd fasf df aljdsfljasdlkfj laksjdfl sljd flajsdjjd sfkjd kkdfkj dkjfj asd asdfasdf  asd s s asasdff dsdafdfa asdfss sddds a s ddsafdasdf asd sd as sdadsad  asdsds a sdfssfd"];
    
Step 2 - Create Introduction View
-----------------------
Once you panels have been created,  you are ready to create the introduction view. You will pass the panels you just created into this method where they will be rendered (in order) in the introduction view. An example can be found below.

    MYIntroductionView *introductionView = [[MYIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) headerImage:[UIImage imageNamed:@"SampleHeaderImage.png"] panels:@[panel, panel2]];

Don't forget to set the delegate to the calling class if you are using delegation for any callbacks

    introductionView.delegate = self;

Step 3 - Show the Introduction View
-----------------------
    
    [introductionView showInView:self.view];

And that's it!

Modifying and Extending
========================

Most UI Elements were left as properties to aid in customization. Try them out for yourself!
