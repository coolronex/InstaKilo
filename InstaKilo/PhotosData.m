//
//  PhotosData.m
//  InstaKilo
//
//  Created by Aaron Chong on 1/31/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "PhotosData.h"

@implementation PhotosData

- (instancetype)initWithPicture:(UIImage *)picture subject:(NSString *)subject{
    
    self = [super init];
    if (self) {
        
        _picture = picture;
        _subject = subject;
    }
    return self;
}

@end
