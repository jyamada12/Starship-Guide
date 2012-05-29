//
//  StarshipsMasterViewController.m
//  Starship Guide
//
//  Created by Jordan Yamada on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StarshipsDetailViewController.h"
#import "StarshipsMasterViewController.h"

@interface StarshipsMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation StarshipsMasterViewController

@synthesize thePath;


- (void)awakeFromNib
{
    NSLog(@"Master awakeFromNib");
    
    //This Gets the Plist Array at the start of the code
    thePath = [[NSBundle mainBundle]  pathForResource:@"StarshipData" ofType:@"plist"];
    _objects = [[NSMutableArray alloc] initWithContentsOfFile:thePath];
    
    [super awakeFromNib];
}

- (void)viewDidLoad
{
     NSLog(@"Master viewDidLoad");
    
    //Make Sure that whenever the view loads _objects is updated
    _objects = [[NSMutableArray alloc] initWithContentsOfFile:thePath];
    
    //Adding the Edit Button
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
   
    //Refresh All Objects
    [self.tableView reloadData];
    
    [super viewDidLoad];

}

- (void)viewDidUnload
{
     NSLog(@"Master viewDidUnload");
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    NSArray *tempKeys = [[NSArray alloc]initWithObjects:@"Name",@"Captian", @"From", @"Description", nil];
    NSArray *tempObjects = [[NSArray alloc]initWithObjects:@"EditMe",@"EditMe", @"EditMe", @"EditMe", nil];
    NSDictionary *newShip = [[NSDictionary alloc]initWithObjects:tempObjects forKeys:tempKeys];
    [_objects insertObject:newShip atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Make a cell and set the title label to the "Name" in each of the ships dictionaries
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *object = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = [object objectForKey:@"Name"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Set Up Editting
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_objects writeToFile:thePath atomically:YES];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
    [self.tableView reloadData];
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Things to do befor going to the Detail View
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
     NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSObject *object = [_objects objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
    
     //Things to do befor going to the Adding View
    if ([[segue identifier] isEqualToString:@"adding"]) {
        NSLog(@"Going into adding controller");
        
    }

}


@end
