//
//  DataModel.h
//  InstaKilo
//
//  Created by Carl Udren on 1/27/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (strong, nonatomic) NSDictionary *dictionary;
@property (strong, nonatomic) NSDictionary *responseDictionary;


- (instancetype)initWithContent;

- (NSDictionary *) getPhotos: (NSString *) key;

@end
