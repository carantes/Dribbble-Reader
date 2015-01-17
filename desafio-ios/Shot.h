//
//  Shot.h
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 16/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shot : NSObject

@property (nonatomic, assign) int id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, assign) int viewCount;
@property (nonatomic, retain) NSString * shortDescription;


- (id)initWithId:(int)id andTitle:(NSString *)title andImage:(NSString *)image andViewCount:(int)viewCount andDescription:(NSString *)shortDescription;


@end
