//
//  DownloadMapsCell.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import <Foundation/Foundation.h>
#import "DownloadMapsCell.h"

@implementation DownloadMapsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.identImageView.image = nil;
    self.textLabel.text = @"";
    self.downloadProgressView.hidden = true;
}

- (void)setLabel:(NSString *)string {
    self.regionNameLabel.text = string;
}

@end
