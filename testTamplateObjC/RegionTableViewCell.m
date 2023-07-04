//
//  RegionTableViewCell.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import "RegionTableViewCell.h"

@interface RegionTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *isDownloadedImageView;
@property (weak, nonatomic) IBOutlet UILabel *regionNameLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *downloadProgressView;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;

@end

@implementation RegionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.downloadProgressView.hidden = true;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.isDownloadedImageView.image = nil;
    self.textLabel.text = @"";
    self.downloadProgressView.hidden = true;
}

- (void)setLabel:(NSString *)string {
    self.regionNameLabel.text = string;
}

- (void)setupCell:(DownloadMapCellModel *)cellModel {
//    NSString *imageName = cellModel.hasDownloadedMap ? @"ic_custom_map_green" : @"ic_custom_map";
    self.isDownloadedImageView.image = [UIImage imageNamed:@"ic_custom_map"];
    self.regionNameLabel.text = cellModel.name;
    self.arrowImageView.hidden = !cellModel.hasRegions;
    self.downloadButton.hidden = cellModel.hasRegions;
    self.downloadProgressView.progress = cellModel.progress;
    
    if (cellModel.progress > 0 && cellModel.progress < 1) {
        self.downloadProgressView.hidden = false;
    }
    if (cellModel.progress == 1) {
        self.downloadProgressView.hidden = true;
        self.downloadButton.hidden = true;
        self.isDownloadedImageView.image = [UIImage imageNamed:@"ic_custom_map_green"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)downloadMapButtonTapped:(UIButton *)sender {
    self.downloadProgressView.hidden = false;
    
    if ([self.delegate respondsToSelector:@selector(didTapButtonInCell:)]) {
        [self.delegate didTapButtonInCell:sender];
    }
}

@end
