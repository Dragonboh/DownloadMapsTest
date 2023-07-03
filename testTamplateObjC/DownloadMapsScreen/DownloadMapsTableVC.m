//
//  DownloadMapsTableVC.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import <Foundation/Foundation.h>
#import "DownloadMapsTableVC.h"
#import "DownloadMapsCell.h"
#import "XMLParser.h"

// TODO: move this to Router (Coordinator) after finishing downloading functionality
#import "RegionMapsTableVC.h"
#import "RegionMapsViewModel.h"

@interface DownloadMapsTableViewController ()

@end

@implementation DownloadMapsTableViewController

+ (DownloadMapsTableViewController *)instatiate {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DownloadMapsTableViewController *controller = (DownloadMapsTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"DownloadMapsTableViewController"];
    
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
    self.navigationItem.title = @"Download Maps";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationController.navigationBar.backgroundColor = [UIColor colorNamed:@"navBarColor"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.displayModel.allKeys.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.viewModel.displayModel.allKeys[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = self.viewModel.displayModel.allKeys[section];
    return [self.viewModel.displayModel objectForKey:key].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DownloadMapsCell *cell = (DownloadMapsCell *)[tableView dequeueReusableCellWithIdentifier:@"RegionTableViewCell" forIndexPath:indexPath];
    NSString *key = self.viewModel.displayModel.allKeys[indexPath.section];
    DownloadMapCellModel *cellModel = [[self.viewModel.displayModel objectForKey:key] objectAtIndex:indexPath.row];
    [cell setupCell:cellModel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel didSelectRow:indexPath.row];
}

- (IBAction)downloadButtonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    CGPoint buttonPosition = [button convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    DownloadMapsCell *cell = (DownloadMapsCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    cell.downloadProgressView.hidden = false;
    
    for (int i = 0; i <= 100; i ++) {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * 0.25 * NSEC_PER_SEC));
        __weak typeof(self) weakSelf = self;
        dispatch_after(popTime, dispatch_get_main_queue(), ^{
            __strong typeof(self) strongSelf = weakSelf;
            if (strongSelf) {
                // Your code to be executed after 1 second
                [cell.downloadProgressView setProgress:i/100 animated: true];
                NSLog(@"This is executed 1 second later");
            }
        });
//        dispatch_after([NSDate now] , dispatch_queu, <#^(void)block#>)
//        dispatch_after(dispatch_time_t when, dispatch_queue_t queue,
//                dispatch_block_t block);
//        dispatch_async(dispatch_main(), <#^(void)block#>)
//        dispatch_main()
    }
}

@end
