//
//  NSDictionary+JSONData.m
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 17/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "NSDictionary+JSONData.h"

@implementation NSDictionary (JSONData)

+(NSDictionary*)dictionaryWithContentsOfJSONURLString:
(NSString*)urlAddress
{
    NSData* data = [NSData dataWithContentsOfURL:
                    [NSURL URLWithString: urlAddress] ];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

-(NSData*)toJSON
{
    NSError* error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;    
}

@end
