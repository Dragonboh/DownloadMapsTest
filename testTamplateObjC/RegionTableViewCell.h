//
//  RegionTableViewCell.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import <UIKit/UIKit.h>
#import "DownloadMapCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegionTableViewCell : UITableViewCell

- (void)setupCell:(DownloadMapCellModel *)cellModel;

@end

NS_ASSUME_NONNULL_END
