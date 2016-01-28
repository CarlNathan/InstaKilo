//
//  aCollectionViewCell.m
//  InstaKilo
//
//  Created by Carl Udren on 1/27/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "aCollectionViewCell.h"

@implementation aCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;
}

@end
