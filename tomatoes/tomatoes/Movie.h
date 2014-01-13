//
//  Movie.h
//  tomatoes
//
//  Created by Thanawat Kaewka on 1/12/14.
//  Copyright (c) 2014 thanawat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSArray *cast;

- (NSString*) title;
- (NSString*) summary;
- (NSString*) image;
- (NSArray*) cast;

- (id) initWithDictionary:(NSDictionary *)dictionary;
- (NSString*) getCastWithSeparator:(NSString*)sep;
- (NSData*) getImageData;


@end
