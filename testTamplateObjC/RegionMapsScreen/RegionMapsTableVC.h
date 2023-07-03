//
//  RegionMapsTableVC.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#ifndef RegionMapsTableVC_h
#define RegionMapsTableVC_h

#import <UIKit/UIKit.h>
#import "RegionMapsViewModel.h"

@interface RegionMapsTableViewController : UITableViewController

@property (nonatomic, strong) RegionMapsViewModel *viewModel;

+ (RegionMapsTableViewController *)instatiate;


@end

#endif /* RegionMapsTableVC_h */
