//
//  ShotDetailViewController.h
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 17/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Shot;
@class ShotView;

@interface ShotDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet ShotView *shotView;
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *profileNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *shotDescriptionTextView;

@property (strong, nonatomic) Shot *shot;

@end
