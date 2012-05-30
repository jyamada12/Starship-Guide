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
@synthesize captainLabel = _captianLabel;
@synthesize nameLabel = _nameLabel;
@synthesize detailDescription = _detailDescription;
@synthesize fromLabel = _fromLabel;
@synthesize shipImage = _shipImage;

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
    NSString *shipName =[self.detailItem objectForKey:@"Name"];
    NSLog(@"shipName:%@",shipName);
    //Get Picuture
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:shipName ofType:@"jpg"];
   /*
    if ((imagePath.length == 0)){
        shipName = @"default";
        NSLog(@"Setting it to Default");
    }
    */ 
   
    NSLog(@"imagePath:%@",imagePath);
    UIImage *tempImage = [[UIImage alloc]initWithContentsOfFile:imagePath];
    
    if(tempImage == nil){
         NSLog(@"Setting it to Default");
        tempImage = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"default" ofType:@"jpg"]];
    }
    
    //Easter Egg Setup
    if ([shipName isEqual:@"Eagle 5"]) {
        NSLog(@"Running Easter Egg");
        self.detailDescription.text = @"It's a Winnebago!";
        self.captainLabel.text = @"Lone Star";
        self.nameLabel.text = @"Eagle 5";
        self.fromLabel.text = @"Spaceballs";
        self.shipImage.image = tempImage;
    } else{

    
    //Regular Setup
        if (self.detailItem) {
            NSLog(@"Running Normal Setup");
            self.detailDescription.text = [self.detailItem objectForKey:@"Description"];
            self.captainLabel.text = [self.detailItem objectForKey:@"Captian"];
            self.nameLabel.text = [self.detailItem objectForKey:@"Name"];
            self.fromLabel.text = [self.detailItem objectForKey:@"From"];
            self.shipImage.image = tempImage;
        }
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
    [self setCaptainLabel:nil];
    [self setNameLabel:nil];
    [self setFromLabel:nil];
    [self setShipImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescription = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
