//
//  ShotCollectionViewCell.h
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 16/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShotCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *shotImage;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *viewCountLabel;

@end
