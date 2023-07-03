//
//  DownloadMapsCell.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#ifndef DownloadMapsCell_h
#define DownloadMapsCell_h

#import <UIKit/UIKit.h>
#import "DownloadMapCellModel.h"

@interface DownloadMapsCell : UITableViewCell

// move it to .m file for private
@property (weak, nonatomic) IBOutlet UIImageView *identImageView;
@property (weak, nonatomic) IBOutlet UILabel *regionNameLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *downloadProgressView;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;

- (void)setLabel:(NSString *)string;
- (void)setupCell:(DownloadMapCellModel *)cellModel;
@end


#endif /* DownloadMapsCell_h */
