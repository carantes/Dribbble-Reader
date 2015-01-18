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
#import "Shot.h"
#import "UIImageView+AFNetworking.h"
#import "ShotDetailViewController.h"

@interface PopularListCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *shots;

@end

@implementation PopularListCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchShots];
}

- (void)fetchShots {

    NSURL *url = [NSURL URLWithString:@"http://api.dribbble.com/shots/popular?page=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //NSLog(@"%@", responseObject);
        
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
    
        self.shots = [responseDictionary valueForKey:@"shots"];
        
        NSLog(@"result count = %i", [_shots count]);
        
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
    
    cell.titleLabel.text = shot.title;
    [cell.titleLabel sizeToFit];
    
    cell.viewCountLabel.text = [NSString stringWithFormat:@"%2i", shot.views_count];
    [cell.viewCountLabel sizeToFit];
    
    NSURL *url = [NSURL URLWithString:shot.image_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"Placeholder"];
    __weak ShotCollectionViewCell *weakCell = cell;
    
    [cell.shotImage setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCell.shotImage.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    
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
/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGSize retVal = CGSizeMake(280, 280);
    
    return retVal;
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 20, 20, 20);
}
*/
@end
