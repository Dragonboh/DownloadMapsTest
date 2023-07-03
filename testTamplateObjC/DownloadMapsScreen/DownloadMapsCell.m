//
//  DownloadMapsCell.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import <Foundation/Foundation.h>
#import "DownloadMapsCell.h"

@implementation DownloadMapsCell
//@property (weak, nonatomic) IBOutlet UIImageView *identImageView;
//@property (weak, nonatomic) IBOutlet UILabel *regionNameLabel;
//@property (weak, nonatomic) IBOutlet UIProgressView *downloadProgressView;
//@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
//@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
- (void)awakeFromNib {
    [super awakeFromNib];
    self.identImageView.image = nil;
    self.textLabel.text = @"";
    self.downloadProgressView.hidden = true;
}

- (void)setLabel:(NSString *)string {
    self.regionNameLabel.text = string;
}

- (void)setupCell:(DownloadMapCellModel *)cellModel {
    NSString *imageName = cellModel.hasDownloadedMap ? @"ic_custom_map_green" : @"ic_custom_map";
    self.identImageView.image = [UIImage imageNamed:imageName];
    self.regionNameLabel.text = cellModel.name;
    self.arrowImageView.hidden = !cellModel.hasRegions;
    self.downloadButton.hidden = cellModel.hasRegions;
}

@end
