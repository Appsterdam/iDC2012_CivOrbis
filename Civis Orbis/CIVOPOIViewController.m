//
//  CIVOPOIViewController.m
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
/*

Copyright (c) 2012, Nelson Ferraz and Kris Markel
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

	• Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
	• Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/
//

#import "CIVOPOIViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "CIVOCheckInViewController.h"
#import "POI.h"

@interface CIVOPOIViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *checkInButton;
@property (weak, nonatomic) IBOutlet UILabel *atSiteLabel;

- (IBAction)checkInButtonTapped:(id)sender;

- (void) configureView;

@end

@implementation CIVOPOIViewController
@synthesize scrollView;
@synthesize textView;
@synthesize checkInButton;
@synthesize atSiteLabel;
@synthesize POI = _POI;

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
	
	// Fancy up the button.
	self.checkInButton.titleLabel.font = [UIFont fontWithName:@"IM FELL English" size:20];
	[self.checkInButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
	
	// Fancy up the text.
	self.textView.font = [UIFont fontWithName:@"Fondamento" size:18];
	self.atSiteLabel.font = [UIFont fontWithName:@"Fondamento" size:14];

	[self configureView];
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	// To be extra safe, make sure the nav bar is showing.
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidUnload
{
	[self setTextView:nil];
	[self setCheckInButton:nil];
	[self setAtSiteLabel:nil];
	[self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	// HACKHACK: Deal with rotation in the clumsiest way possible.
	[self configureView];
}

#pragma mark - Properties

- (void) setPOI:(POI *)newPOI
{
	if (_POI != newPOI) {
		_POI = newPOI;
		
		// Update the view.
		[self configureView];
	}
}

#pragma mark - Private

- (IBAction)checkInButtonTapped:(id)sender {
	
	CIVOCheckInViewController *checkInViewController = [[CIVOCheckInViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:checkInViewController animated:YES];
	
}

- (void) configureView
{
	if (!self.isViewLoaded) {
		return;
	}
	
	self.title = self.POI.name;
	self.textView.text = self.POI.text;
	
	// resize the text view to fit its text.
	CGRect frame = self.textView.frame;
	frame.size.height = self.textView.contentSize.height; 
	self.textView.frame = frame;
	
	// Place the button.
	CGFloat bottom = self.textView.frame.origin.y + self.textView.frame.size.height;
	bottom = bottom + 5.0; //padding
	self.checkInButton.frame = (CGRect) {
		.size = self.checkInButton.frame.size,
		.origin.x = self.checkInButton.frame.origin.x,
		.origin.y = bottom,
	};
	
	// Place the asSiteLabel.
	bottom = bottom + self.checkInButton.frame.size.height;
	bottom = bottom + 5.0; //padding
	self.atSiteLabel.frame = (CGRect) {
		.size = self.atSiteLabel.frame.size,
		.origin.x = self.atSiteLabel.frame.origin.x,
		.origin.y = bottom,
	};
	
	bottom = bottom + self.atSiteLabel.frame.size.height;
	bottom = bottom + 5;
	self.scrollView.contentSize = (CGSize) {
		.width = self.scrollView.contentSize.width,
		.height = bottom,
	};
	
	self.scrollView.contentOffset = CGPointZero;
	[self.scrollView flashScrollIndicators];
}

@end
