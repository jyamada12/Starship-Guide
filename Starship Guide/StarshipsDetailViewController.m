//
//  StarshipsDetailViewController.m
//  Starship Guide
//
//  Created by Jordan Yamada on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StarshipsDetailViewController.h"

@interface StarshipsDetailViewController ()
- (void)configureView;
@end

@implementation StarshipsDetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescription = _detailDescription;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescription.text = [self.detailItem objectForKey:@"Description"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{                          
    [self setDetailDescription:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescription = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
