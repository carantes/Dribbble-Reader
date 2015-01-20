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
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface ShotDetailViewController ()

@end

@implementation ShotDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.profileNameLabel.text = self.shot.player.name;
    
    NSAttributedString *attributedDescription = [[NSAttributedString alloc] initWithData:[self.shot.description dataUsingEncoding:NSUTF8StringEncoding]
                                     options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                               NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                          documentAttributes:nil error:nil];
    
    [[self.shotDescriptionTextView textStorage] setAttributedString:attributedDescription];
    
    [self.profileImageView.layer setMasksToBounds:YES];
    self.profileImageView.layer.cornerRadius = 25.0f;
    
    NSURL *url = [NSURL URLWithString:self.shot.player.avatar_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"Profile"];
    
    __weak UIImageView *weakImageView = self.profileImageView;
    
    [self.profileImageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakImageView.image = image;
                                       [weakImageView setNeedsLayout];
                                       
                                   } failure:nil];
    
}

@end
