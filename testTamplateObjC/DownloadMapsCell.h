//
//  DownloadMapsCell.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#ifndef DownloadMapsCell_h
#define DownloadMapsCell_h

#import <UIKit/UIKit.h>

@interface DownloadMapsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *identImageView;
@property (weak, nonatomic) IBOutlet UILabel *regionNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *downloadImageVIew;

- (void)setLabel:(NSString *)string;
@end


#endif /* DownloadMapsCell_h */
