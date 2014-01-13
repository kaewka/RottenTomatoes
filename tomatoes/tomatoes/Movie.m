//
//  Movie.m
//  tomatoes
//
//  Created by Thanawat Kaewka on 1/12/14.
//  Copyright (c) 2014 thanawat. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id) initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.title = [dictionary objectForKey:@"title"];
        self.summary = [dictionary objectForKey:@"synopsis"];
        self.image = [[dictionary objectForKey: @"posters"] objectForKey:@"original"];
    
        NSMutableArray* names = [NSMutableArray array];
        NSArray* casts = [dictionary objectForKey:@"abridged_cast"];
        for (int i=0;i < casts.count; i++) {
            NSDictionary* cast = [casts objectAtIndex:i];
            NSString* actor = [cast objectForKey:@"name"];
            [names addObject:actor];
        }
    
        self.cast = names;
    }
    return self;
}

- (NSString*) getCastWithSeparator: (NSString*)sep {
    return [self.cast componentsJoinedByString: sep];
}

- (NSData*) getImageData {
    NSURL *imageURL = [NSURL URLWithString: self.image];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    return imageData;
}

@end
