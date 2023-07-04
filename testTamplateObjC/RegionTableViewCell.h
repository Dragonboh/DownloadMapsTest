//
//  RegionTableViewCell.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import <UIKit/UIKit.h>
#import "DownloadMapCellModel.h"

NS_ASSUME_NONNULL_BEGIN


@protocol CustomTableViewCellDelegate <NSObject>

- (void)didTapButtonInCell:(UIButton *)button;

@end

@interface RegionTableViewCell : UITableViewCell

@property (nonatomic, weak) id<CustomTableViewCellDelegate> delegate;

- (void)setupCell:(DownloadMapCellModel *)cellModel;

@end

NS_ASSUME_NONNULL_END
