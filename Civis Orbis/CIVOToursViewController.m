//
//  CIVOToursViewController.m
//  Civis Orbis
//
//  Created by Kris Markel on 7/22/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import "CIVOToursViewController.h"

@interface CIVOToursViewController ()

- (IBAction)cancelButtonTapped:(id)sender;

@end

@implementation CIVOToursViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)cancelButtonTapped:(id)sender {

	[self dismissModalViewControllerAnimated:YES];

}

@end
