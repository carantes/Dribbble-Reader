//
//  Shot.m
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 16/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "Shot.h"

@implementation Shot

- (id)initWithId:(int)id andTitle:(NSString *)title andImage:(NSString *)image andViewCount:(int)viewCount andDescription:(NSString *)shortDescription{
    self = [super init];
    if (self) {
        
        self.id = id;
        self.title = title;
        self.image = image;
        self.viewCount = viewCount;
        self.shortDescription = shortDescription;
    }
    
    return self;
}

@end
