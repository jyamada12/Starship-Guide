//
//  AddingViewController.h
//  Starship Guide
//
//  Created by Jordan Yamada on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StarshipsMasterViewController.h"
#import <UIKit/UIKit.h>

@interface AddingViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITextField *captainInput;
@property (weak, nonatomic) IBOutlet UITextField *fromInput;
@property (weak, nonatomic) IBOutlet UITextField *descriptionInput;
@property NSMutableArray *_objects;


@end
