//
//  RegionMapsTableVC.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import "RegionMapsTableVC.h"

@implementation RegionMapsTableViewController

+ (RegionMapsTableViewController *)instatiate {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    RegionMapsTableViewController *controller = (RegionMapsTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"RegionMapsTableViewController"];
    
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"RegionTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"RegionTableViewCell"];
}

@end
