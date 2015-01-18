//
//  Player.h
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 17/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "JSONModel.h"

@protocol Player
@end

@interface Player : JSONModel

@property (nonatomic, assign) int id;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * avatar_url;

@end
