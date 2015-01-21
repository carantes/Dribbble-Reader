//
//  ShotDetailViewController.m
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 17/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "ShotDetailViewController.h"
#import "Shot.h"
#import "Player.h"
#import "UIKit+AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "ShotView.h"

@interface ShotDetailViewController ()

@end

@implementation ShotDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Shot
    self.shotView.titleLabel.text = self.shot.title;
    self.shotView.viewCountLabel.text = [NSString stringWithFormat:@"%2i", self.shot.views_count];
    
    //Load cached shot image
    [self.shotView.shotImageView setImageWithURL:[NSURL URLWithString:self.shot.image_url] placeholderImage:[UIImage imageNamed:@"Placeholder"]];
    
    NSAttributedString *attributedDescription = [[NSAttributedString alloc] initWithData:[self.shot.description dataUsingEncoding:NSUTF8StringEncoding]
                                                                                 options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                                           NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                                      documentAttributes:nil error:nil];
    
    [[self.shotDescriptionTextView textStorage] setAttributedString:attributedDescription];
    
    //Player
    self.profileNameLabel.text = self.shot.player.name;
    
    [self.profileImageView.layer setMasksToBounds:YES];
    self.profileImageView.layer.cornerRadius = 25.0f;
    
    //Load cached image
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.shot.player.avatar_url] placeholderImage:[UIImage imageNamed:@"Profile"]];
}

@end
