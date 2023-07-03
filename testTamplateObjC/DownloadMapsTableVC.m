//
//  DownloadMapsTableVC.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import <Foundation/Foundation.h>
#import "DownloadMapsTableVC.h"
#import "DownloadMapsCell.h"
#import "RegionTableViewModel.h"

#import "XMLParser.h"

@interface DownloadMapsTableViewController ()

@end

@implementation DownloadMapsTableViewController

+ (DownloadMapsTableViewController *)instatiate {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    DownloadMapsTableViewController *controller = (DownloadMapsTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"DownloadMapsTableViewController"];
    
//    storyboard.instantiateViewController(withIdentifier: "EventListViewController") as! EventListViewController
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    Rectangle* rec = [[Rectangle alloc] init];
//    [rec setHeight: 10];
//    NSLog(@"%i", rec.height);
    
    [self setupView];
    
//    [self.viewModel fetchData];
    
//    XMLParser *parser = [[XMLParser alloc] init];
//    [parser parseXML];
    
//    [self.tableView registerClass:DownloadMapsCell.class forCellReuseIdentifier:@"region123"];
}

- (void)setupView {
    self.navigationItem.title = @"Download Maps";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationController.navigationBar.backgroundColor = [UIColor colorNamed:@"navBarColor"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.regions.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.viewModel.regions[section].name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.regions[section].maps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DownloadMapsCell *cell = (DownloadMapsCell *)[tableView dequeueReusableCellWithIdentifier:@"region123" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[DownloadMapsCell alloc] init];
    }
    
    // TODO: move to [cell setupWithModel: (DownloadMapsCellModel *)model];
    cell.identImageView.image = [UIImage imageNamed:@"ic_custom_map"];
    Region *cellRegion = self.viewModel.regions[indexPath.section].maps[indexPath.row];
    if (cellRegion.maps.count > 0 ) {
        cell.downloadImageView.image = [UIImage imageNamed:@"ic_custom_chevron"];
        cell.downloadButton.hidden = true;
        cell.downloadImageView.hidden = false;
    } else {
        cell.downloadImageView.hidden = true;
        cell.downloadButton.hidden = false;
//        cell.downloadButton.titleLabel.text = @"";
//        UIImage *buttonBackgroundImage = [UIImage imageNamed:@"ic_custom_dowload"];
//        buttonBackgroundImage.renderingMode = UIImageRenderingModeAlwaysOriginal;
//        cell.downloadButton.imageView.image = [UIImage imageNamed:@"ic_custom_dowload"];
//        [cell.downloadButton setBackgroundImage:[buttonBackgroundImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//        [cell.downloadButton setBackgroundImage:[buttonBackgroundImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
        
//        cell.downloadImageView.image = [UIImage imageNamed:@"ic_custom_dowload"];
    }
//    cellRegion.maps.count > 0 ?
//        cell.downloadImageVIew.image = [UIImage imageNamed:@"ic_custom_dowload"]
//        : cell.downloadImageVIew.image = [UIImage imageNamed:@"ic_custom_dowload"];
    [cell.downloadProgressView setProgress:0.0];
    [cell setLabel:@"NewCell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: move to viewModel usinc Router
    
    DownloadMapsTableViewController *newVC = [DownloadMapsTableViewController instatiate];
    RegionTableViewModel *newViewModel = [[RegionTableViewModel alloc] initWithRegions:self.viewModel.regions[indexPath.section].maps[indexPath.row].maps];
    
    newVC.viewModel = newViewModel;
    
    [self.navigationController pushViewController:newVC animated:false];
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
