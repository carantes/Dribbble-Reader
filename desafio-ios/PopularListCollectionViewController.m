//
//  PopularListCollectionViewController.m
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 16/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "ShotListCollectionViewController.h"
#import "Shot.h"
#import "ShotCollectionViewCell.h"

@interface ShotListCollectionViewController ()

@property(nonatomic, strong) NSMutableArray *shots;

@end

@implementation ShotListCollectionViewController

static NSString * const reuseIdentifier = @"shotCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Shot *shot1 = [[Shot alloc] initWithId:1885573 andTitle:@"Cape Brewing Company" andImage:@"ship_dribble_teaser" andViewCount:1357 andDescription:@"We illustrated these two labels for the Cape Brewing Company, a South African producer of craft beer"];
    
    _shots = [NSMutableArray arrayWithObjects:shot1, shot1,shot1,shot1,shot1,shot1,nil];

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
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_shots count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"shotCell";
    
    ShotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    Shot *shot = [self.shots objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = shot.title;
    [cell.titleLabel sizeToFit];
    
    cell.viewCountLabel.text = [NSString stringWithFormat:@"%2i", shot.viewCount];
    [cell.viewCountLabel sizeToFit];
    
    //recipeImageView.image = [UIImage imageNamed:@"angry_birds_cake"];
    
    return cell;
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

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGSize retVal = CGSizeMake(280, 280);
    
    return retVal;
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

@end
