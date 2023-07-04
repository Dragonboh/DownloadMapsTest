//
//  RegionMapsTableVC.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import "RegionMapsTableVC.h"
#import "RegionTableViewCell.h"

@implementation RegionMapsTableViewController

+ (RegionMapsTableViewController *)instatiate {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegionMapsTableViewController *controller = (RegionMapsTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"RegionMapsTableViewController"];
    
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self.viewModel fetchData];
}

- (void)setupView {
    UINib *nib = [UINib nibWithNibName:@"RegionTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"RegionTableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = self.viewModel.title;
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    self.navigationController.navigationBar.backItem.title = @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.regions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RegionTableViewCell *cell = (RegionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"RegionTableViewCell" forIndexPath:indexPath];
    DownloadMapCellModel *cellModel = [self.viewModel.regions objectAtIndex:indexPath.row];
    cell.delegate = self;
    [cell setupCell:cellModel];
    return cell;
}

- (void)didTapButtonInCell:(nonnull UIButton *)button {
    CGPoint buttonPosition = [button convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    [self.viewModel downloadButtonPressed:indexPath];
}

@end
