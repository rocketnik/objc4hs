//
//  OHImageCache.h
//  ImageCache
//
//  Created by Nikolas Mayr on 2010-06-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

@interface OHImageCache : NSObject {
    NSMutableDictionary *dict;
}

+(OHImageCache *)sharedImageCache;
-(UIImage *)imageNamed:(NSString *)name;
-(void)removeImage:(NSString *name);

@end
