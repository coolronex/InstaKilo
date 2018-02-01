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

@property (strong, nonatomic) NSArray <PhotosData *> *picturesArray;
@property (strong, nonatomic) NSMutableArray <NSMutableArray *> *collectionData;
@property (strong, nonatomic) NSMutableSet *sectionSet;
@property (assign, nonatomic) BOOL changeCategories;

@property (strong, nonatomic) PhotosData *photosData;

@end

@implementation PhotosCollectionVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PhotosData *item1 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"angel-falls"] subject:@"Famous places" month:@"January"];
    PhotosData *item2 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"burgers"] subject:@"Food" month:@"February"];
    PhotosData *item3 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"golden-gate-bridge"] subject:@"Famous places" month:@"March"];
    PhotosData *item4 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"machu-picchu"] subject:@"Famous places" month:@"January"];
    PhotosData *item5 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"mt-fuji"] subject:@"Famous places" month:@"February"];
    PhotosData *item6 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"onion-rings"] subject:@"Food" month:@"March"];
    PhotosData *item7 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"pancakes"] subject:@"Food" month:@"January"];
    PhotosData *item8 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"pizza"] subject:@"Food" month:@"February"];
    PhotosData *item9 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"salmon"] subject:@"Food" month:@"March"];
    PhotosData *item10 = [[PhotosData alloc] initWithPicture:[UIImage imageNamed:@"taj-mahal"] subject:@"Famous places" month:@"January"];
    
    self.picturesArray = @[item1, item2, item3, item4, item5, item6, item7, item8, item9, item10];
    self.collectionData = [[NSMutableArray alloc] init]; //array to store both sections and cell data
    
    self.sectionSet = [[NSMutableSet alloc] init]; // store unique sections
    
    self.changeCategories = YES;
    
    [self separateSubjects];
}

// override setter to changeCategories

- (void) separateSubjects {

    for (PhotosData *item in self.picturesArray) {
        
        // if category == true,         then run this....              :         ....else run this.....
        self.changeCategories ? [self.sectionSet addObject:item.subject] : [self.sectionSet addObject:item.month];
    }
    
    NSArray *items = [[NSMutableArray alloc] init];
    for (NSString *section in self.sectionSet) {
        if (self.changeCategories){
          items = [self.picturesArray filteredArrayUsingPredicate: [NSPredicate predicateWithFormat:@"subject == %@", section]];
            
        } else{
        items = [self.picturesArray filteredArrayUsingPredicate: [NSPredicate predicateWithFormat:@"month == %@", section]];
        }
        
        [self.collectionData addObject:[items copy]];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return self.collectionData.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.collectionData[section].count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photosCell" forIndexPath:indexPath];

    PhotosData *photosData = self.collectionData[indexPath.section][indexPath.item];
    cell.photosData = photosData;
    
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    PhotosData *data = self.collectionData[indexPath.section][indexPath.item];
    headerView.headerLabel.text = self.changeCategories ? data.subject : data.month;
    
    return headerView;
}

- (IBAction)categoryChangeButton:(UIBarButtonItem *)sender {
    self.changeCategories = !self.changeCategories;
    [self separateSubjects];
////    if (self.changeCategories == NO) {
////        self.changeCategories = YES;
////
////    } else if (self.changeCategories == YES) {
////        self.changeCategories = NO;
////    }

    [self.collectionView reloadData];
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
