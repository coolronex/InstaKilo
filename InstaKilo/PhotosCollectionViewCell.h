//
//  PhotosCollectionViewCell.h
//  InstaKilo
//
//  Created by Aaron Chong on 1/31/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotosData.h"

@interface PhotosCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (strong, nonatomic) PhotosData *photosData;

@end
