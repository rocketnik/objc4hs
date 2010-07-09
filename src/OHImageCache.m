//
//  OHImageCache.m
//  ImageCache
//
//  Created by Nikolas Mayr on 2010-06-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OHImageCache.h"


@implementation OHImageCache

-(id)init {
    [super init];
    dict = [[NSMutableDictionary alloc] init];
    return self;
}

-(void)dealloc {
    [dict release];
    [super dealloc];
}

-(UIImage *)imageNamed:(NSString *)name {
    OHImageCacheImage *img = [dict objectForKey:name];
    if (!img) {
        img = [OHImageCacheImage imageNamed:name];
        img._ohName = name;
        img._ohImageCache = self;
        [dict setObject:[img autorelease] forKey:name];
    }
    return img;
}

-(void)removeImage:(NSString *)name {
    [[dict objectForKey:name] retain];
    [dict removeObjectForKey:name];
}

+(OHImageCache *)sharedImageCache {
    static OHImageCache *cache;
    if (!cache) cache = [[OHImageCache alloc] init];
    return cache;
}

@end
