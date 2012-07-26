//
//  CIVOCheckInViewController.m
//  Civis Orbis
//
//  Created by Kris Markel on 7/22/12.
/*

Copyright (c) 2012, Nelson Ferraz and Kris Markel
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

	• Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
	• Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/
//

#import "CIVOCheckInViewController.h"

@interface CIVOCheckInViewController ()

@property (weak, nonatomic) IBOutlet UILabel *checkInLabel;
@property (weak, nonatomic) IBOutlet UILabel *saySomethingLabel;
@property (weak, nonatomic) IBOutlet UIButton *publishButton;

- (IBAction)publishButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;

@end

@implementation CIVOCheckInViewController
@synthesize checkInLabel;
@synthesize saySomethingLabel;
@synthesize publishButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	self.publishButton.titleLabel.font = [UIFont fontWithName:@"IM FELL English" size:20];
	[self.publishButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
	
	self.checkInLabel.font = [UIFont fontWithName:@"IM FELL English" size:30];
	self.saySomethingLabel.font = [UIFont fontWithName:@"IM FELL English" size:20];

}

- (void)viewDidUnload
{
	[self setCheckInLabel:nil];
	[self setSaySomethingLabel:nil];
	[self setPublishButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)publishButtonTapped:(id)sender {
	
	[self dismissModalViewControllerAnimated:YES];
	
}

- (IBAction)cancelButtonTapped:(id)sender {
	
	[self dismissModalViewControllerAnimated:YES];
	
}
@end
