//
//  NSDictionary+JSONData.h
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 17/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONData)

+(NSDictionary*)dictionaryWithContentsOfJSONURLString:
(NSString*)urlAddress;

-(NSData*)toJSON;

@end
