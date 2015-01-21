//
//  ShotView.m
//  desafio-ios
//
//  Created by Carlos Eduardo Arantes Ferreira on 20/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "ShotView.h"

@implementation ShotView

-(void)awakeFromNib {
    //Note That You Must Change @”BNYSharedView’ With Whatever Your Nib Is Named
    [[NSBundle mainBundle] loadNibNamed:@"ShotView" owner:self options:nil];
    [self addSubview: self.contentView];
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.contentView.frame = self.bounds;
}

@end
