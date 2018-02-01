//
//  PhotosData.h
//  InstaKilo
//
//  Created by Aaron Chong on 1/31/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"


@interface PhotosData : NSObject

@property UIImage *picture;
@property NSString *subject;
@property NSString *month;

- (instancetype)initWithPicture:(UIImage *)picture subject:(NSString *)subject month:(NSString *)month;

@end
