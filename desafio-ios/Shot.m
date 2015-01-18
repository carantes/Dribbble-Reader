//
//  Shot.m
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 16/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "Shot.h"

@implementation Shot

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
        @"description": @"shotDescription",
        @"image_url" : @"image_400_url"}];
}

- (NSString *)description {
    return self.shotDescription;
}

@end
