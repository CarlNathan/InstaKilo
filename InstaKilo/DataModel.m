//
//  DataModel.m
//  InstaKilo
//
//  Created by Carl Udren on 1/27/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (instancetype)initWithContent
{
    self = [super init];
    if (self) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        dict[@"All Photos"] = @{@"All Photos" : @[@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",@"image5.jpg",@"image7.jpg",@"image8.jpg",@"image9.jpg",@"image10.jpg"]};
        
        dict[@"Locations"] = @{@"North America" : @[@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",@"image5.jpg"], @"Asia": @[@"image7.jpg",@"image8.jpg",@"image9.jpg",@"image10.jpg"]};
        
        dict[@"Subjects"] = @{@"Happy" : @[@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",@"image5.jpg"], @"Sad": @[@"image7.jpg",@"image8.jpg",@"image9.jpg",@"image10.jpg"], @"Pictures of Pencils" : @[@"image1.jpg"]};
        _dictionary = [dict copy];
    }
    return self;
}

- (NSDictionary *) getPhotos: (NSString *) key {
    return self.dictionary[key];
}

@end

