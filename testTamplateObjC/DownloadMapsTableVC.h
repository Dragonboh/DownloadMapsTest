//
//  DownloadMapsTableVC.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import <UIKit/UIKit.h>
#import "DownloadMapsViewModel.h"
#import "RegionTableViewModel.h"

@interface DownloadMapsTableViewController : UITableViewController


//TODO: change to id < @protocol >
@property (nonatomic, strong) RegionTableViewModel *viewModel;

+ (DownloadMapsTableViewController *)instatiate;

@end
