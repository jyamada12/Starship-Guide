//
//  AddingViewController.h
//  Starship Guide
//
//  Created by Jordan Yamada on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddingViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *donePressed;
@property NSMutableArray *_objects;


@end
