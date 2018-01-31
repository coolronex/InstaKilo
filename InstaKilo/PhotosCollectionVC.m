//
//  PhotosCollectionVC.m
//  InstaKilo
//
//  Created by Aaron Chong on 1/31/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "PhotosCollectionVC.h"
#import "PhotosData.h"
#import "PhotosCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"

@interface PhotosCollectionVC ()

@property (strong, nonatomic) NSMutableArray <PhotosData *> *pictureArray;
@property (strong, nonatomic) PhotosData *photosData;

@end

@implementation PhotosCollectionVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PhotosData *item1 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"angel-falls"] subject:@"famous places"];
    PhotosData *item2 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"burgers"] subject:@"food"];
    PhotosData *item3 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"golden-gate-bridge"] subject:@"famous places"];
    PhotosData *item4 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"machu-picchu"] subject:@"famous places"];
    PhotosData *item5 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"mt-fuji"] subject:@"famous places"];
    PhotosData *item6 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"onion-rings"] subject:@"food"];
    PhotosData *item7 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"pancakes"] subject:@"food"];
    PhotosData *item8 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"pizza"] subject:@"food"];
    PhotosData *item9 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"salmon"] subject:@"food"];
    PhotosData *item10 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"taj-mahal"] subject:@"famous places"];
    
    
    self.pictureArray = [[NSMutableArray alloc] initWithObjects:item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, nil];
    
//    @[ @[...], @[..] ]
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.pictureArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photosCell" forIndexPath:indexPath];

    PhotosData *photosData = self.pictureArray[indexPath.item];
    cell.photosData = photosData;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    
//    self.pictureArray[indexPath.section][0].subject;
    
    return headerView;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
