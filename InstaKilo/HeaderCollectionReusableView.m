//
//  HeaderCollectionReusableView.m
//  InstaKilo
//
//  Created by Carl Udren on 1/27/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "HeaderCollectionReusableView.h"

@implementation HeaderCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.sectionTitle = [[UILabel alloc] init];
        [self addSubview:self.sectionTitle];
        
    }
    return self;
}

- (void) layoutSubviews {
    self.sectionTitle.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.sectionTitle.textColor = [UIColor whiteColor];    
}

@end
