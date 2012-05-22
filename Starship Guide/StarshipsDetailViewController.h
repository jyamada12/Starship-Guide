//
//  StarshipsDetailViewController.h
//  Starship Guide
//
//  Created by Jordan Yamada on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarshipsDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *captianLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailDescription;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;



@end
