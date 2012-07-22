//
//  CIVOCheckInViewController.m
//  Civis Orbis
//
//  Created by Kris Markel on 7/22/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
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
