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
    
    [self.viewModel fetchData];
    
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
    cell.downloadImageVIew.image = [UIImage imageNamed:@"ic_custom_dowload"];
    [cell setLabel:@"NewCell"];
    return cell;
}


@end
