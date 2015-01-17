//
//  ShotDetailViewController.m
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 17/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "ShotDetailViewController.h"

@interface ShotDetailViewController ()

@end

@implementation ShotDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.profileImageView.layer setMasksToBounds:YES];
    self.profileImageView.layer.cornerRadius = 25.0f;
}

@end
