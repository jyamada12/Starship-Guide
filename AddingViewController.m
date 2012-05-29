//
//  AddingViewController.m
//  Starship Guide
//
//  Created by Jordan Yamada on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddingViewController.h"
#import "StarshipsMasterViewController.h"

@interface AddingViewController ()

@end

@implementation AddingViewController
@synthesize nameInput;
@synthesize captainInput;
@synthesize fromInput;
@synthesize descriptionInput;
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
    NSLog(@"Adding viewDidLoad");
    
    //This Gets the Plist Array at the start of the code
    NSString *thePath = [[NSBundle mainBundle]  pathForResource:@"StarshipData" ofType:@"plist"];
    _objects = [[NSMutableArray alloc]initWithContentsOfFile:thePath];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setNameInput:nil];
    [self setCaptainInput:nil];
    [self setFromInput:nil];
    [self setDescriptionInput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//Makes Keyboard go Back
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.nameInput) {
        [theTextField resignFirstResponder];
    }
    if (theTextField == self.captainInput) {
        [theTextField resignFirstResponder];
    }
    if (theTextField == self.fromInput) {
        [theTextField resignFirstResponder];
    }
    if (theTextField == self.descriptionInput) {
        [theTextField resignFirstResponder];
    }
    return YES;
    NSLog(@"%@",self.nameInput.text);
}

//Saves to plist before going back to the Master View
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"doneAdding"]){
        NSString *thePath = [[NSBundle mainBundle]  pathForResource:@"StarshipData" ofType:@"plist"];
        NSArray *tempKeys = [[NSArray alloc]initWithObjects:@"Name",@"Captian", @"From", @"Description", nil];
        NSArray *tempObjects = [[NSArray alloc]initWithObjects:nameInput.text,captainInput.text, fromInput.text,descriptionInput.text, nil];
        NSDictionary *newShip = [[NSDictionary alloc]initWithObjects:tempObjects forKeys:tempKeys];
        [_objects insertObject:newShip atIndex:0];
        
        //NSLog(@"%@",_objects);
        
        [_objects writeToFile:thePath atomically:YES];
    }
}

@end
