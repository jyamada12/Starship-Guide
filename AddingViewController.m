//
//  AddingViewController.m
//  Starship Guide
//
//  Created by Jordan Yamada on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddingViewController.h"

@interface AddingViewController ()

@end

@implementation AddingViewController
@synthesize nameInput;
@synthesize donePressed;
@synthesize _objects;
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
    //This Gets the Plist Array at the start of the code
    NSString *thePath = [[NSBundle mainBundle]  pathForResource:@"StarshipData" ofType:@"plist"];
    _objects = [[NSMutableArray alloc]initWithContentsOfFile:thePath];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setNameInput:nil];
    [self setDonePressed:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)Done:(id)sender {
     NSString *thePath = [[NSBundle mainBundle]  pathForResource:@"StarshipData" ofType:@"plist"];
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    NSArray *tempKeys = [[NSArray alloc]initWithObjects:@"Name",@"Captian", @"From", @"Description", nil];
    NSArray *tempObjects = [[NSArray alloc]initWithObjects:nameInput.text,@"EditMe", @"EditMe", @"EditMe", nil];
    NSDictionary *newShip = [[NSDictionary alloc]initWithObjects:tempObjects forKeys:tempKeys];
    [_objects insertObject:newShip atIndex:0];
    
    [_objects writeToFile:thePath atomically:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.nameInput) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

@end
