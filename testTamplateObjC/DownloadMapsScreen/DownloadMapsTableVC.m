//
//  DownloadMapsTableVC.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import <Foundation/Foundation.h>
#import "DownloadMapsTableVC.h"
#import "XMLParser.h"

@implementation DownloadMapsTableViewController

+ (DownloadMapsTableViewController *)instatiate {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DownloadMapsTableViewController *controller = (DownloadMapsTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"DownloadMapsTableViewController"];
    
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupViewModel];
    [self.viewModel fetchData];
}

- (void)setupViewModel {
    __weak typeof(self) weakSelf = self;
    self.viewModel.updateUI = ^(NSIndexPath *indexPath) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            [strongSelf.tableView reloadRowsAtIndexPaths:@[indexPath]
                                  withRowAnimation:NO];
        }
    };
}

- (void)setupView {
    UINib *nib = [UINib nibWithNibName:@"RegionTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"RegionTableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = @"Download Maps";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationController.navigationBar.backgroundColor = [UIColor colorNamed:@"navBarColor"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"EUROPE";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.regions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RegionTableViewCell *cell = (RegionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"RegionTableViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    DownloadMapCellModel *cellModel = [self.viewModel.regions objectAtIndex:indexPath.row];
    [cell setupCell:cellModel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel didSelectRow:indexPath.row];
}

- (void)didTapButtonInCell:(UIButton *)sender; {
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    [self.viewModel downloadButtonPressed: indexPath];
}

@end
