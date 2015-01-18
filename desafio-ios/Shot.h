//
//  Shot.h
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 16/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Player.h"

@interface Shot : JSONModel

@property (nonatomic, assign) int id;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * shotDescription;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int width;
@property (nonatomic, assign) int likes_count;
@property (nonatomic, assign) int comments_count;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSString * short_url;
@property (nonatomic, assign) int views_count;
@property (nonatomic, strong) NSString * image_url;

@property (nonatomic, strong) Player *player;

@end
