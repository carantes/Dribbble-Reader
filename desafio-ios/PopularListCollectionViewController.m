//
//  PopularListCollectionViewController.m
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 16/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "PopularListCollectionViewController.h"
#import "ShotCollectionViewCell.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "Shot.h"
#import "UIImageView+AFNetworking.h"
#import "ShotDetailViewController.h"
#import "ShotView.h"
#import "MBProgressHUD.h"


@interface PopularListCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *shots;
@property (nonatomic, assign) int page;
@property (nonatomic, assign) CGSize cellSize;

@end

@implementation PopularListCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shots = [[NSMutableArray alloc] init];
    self.page = 1;
    self.cellSize = CGSizeMake(280, 230);

    [self fetchShots];
}

- (void)fetchShots {

    NSString *strURL = [NSString stringWithFormat:@"http://api.dribbble.com/shots/popular?page=%i", self.page];
    
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@", responseObject);
        
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
        
        [self.shots addObjectsFromArray:responseDictionary[@"shots"]];
        
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Dribbble Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"popularListToShotDetailSegue"]) {
        
        ShotDetailViewController *shotDetailController = segue.destinationViewController;
        
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        Shot *shot = [[Shot alloc] initWithDictionary:[self.shots objectAtIndex:indexPath.row] error:nil];
        
        shotDetailController.shot = shot;
        
        //shotDetailController.title = shot.title;
    }
}


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

    Shot *shot = [[Shot alloc] initWithDictionary:[self.shots objectAtIndex:indexPath.row] error:nil];
    
    cell.shotView.titleLabel.text = shot.title;
    [cell.shotView.titleLabel sizeToFit];
    
    cell.shotView.viewCountLabel.text = [NSString stringWithFormat:@"%2i", shot.views_count];
    [cell.shotView.viewCountLabel sizeToFit];
    
    UIImage *placeholder = [UIImage imageNamed:@"Placeholder"];
    [cell.shotView.shotImageView setImageWithURL:[NSURL URLWithString:shot.image_url] placeholderImage:placeholder];
    
    if (indexPath.row == [self.shots count]-1) {
        self.page++;
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            // Do something...
            [self fetchShots];
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            });
        });
        
    }
    
    return cell;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {

    [super traitCollectionDidChange:previousTraitCollection];
    
    
    //Ipad Portrait and Landscape
    if ((self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) && (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular)) {
        self.cellSize = CGSizeMake(320, 300);
    }
    //Iphone Landscape
    else if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        self.cellSize = CGSizeMake(230, 230);
    }
    else
        self.cellSize = CGSizeMake(280, 230);
    
    
    [self.collectionView reloadItemsAtIndexPaths:([self.collectionView indexPathsForVisibleItems])];
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
    return self.cellSize;
}

/*
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 20, 20, 20);
}
*/
@end
