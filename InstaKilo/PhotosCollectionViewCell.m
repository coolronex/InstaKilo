//
//  PhotosCollectionViewCell.m
//  InstaKilo
//
//  Created by Aaron Chong on 1/31/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "PhotosCollectionViewCell.h"


@implementation PhotosCollectionViewCell

- (void) setPhotosData:(PhotosData *)photosData {
    
    _photosData = photosData;
    [self configureCell];
}

- (void) configureCell {
    
    self.photoImageView.image = self.photosData.picture;
    
}


@end
