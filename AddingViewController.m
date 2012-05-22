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
    NSLog(@"view Did Load");
    //This Gets the Plist Array at the start of the code
    NSString *thePath = [[NSBundle mainBundle]  pathForResource:@"StarshipData" ofType:@"plist"];
    _objects = [[NSMutableArray alloc]initWithContentsOfFile:thePath];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setNameInput:nil];
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
    return YES;
    NSLog(@"%@",self.nameInput.text);
}

    /*
    NSString *thePath = [[NSBundle mainBundle]  pathForResource:@"StarshipData" ofType:@"plist"];
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    NSArray *tempKeys = [[NSArray alloc]initWithObjects:@"Name",@"Captian", @"From", @"Description", nil];
    NSArray *tempObjects = [[NSArray alloc]initWithObjects:nameInput.text,@"EditMe", @"EditMe", @"EditMe", nil];
    NSDictionary *newShip = [[NSDictionary alloc]initWithObjects:tempObjects forKeys:tempKeys];
    [_objects insertObject:newShip atIndex:0];
    
    NSLog(@"%@",_objects);
    
    [_objects writeToFile:thePath atomically:YES];
*/
@end
