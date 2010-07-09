//
//  OHImageCacheImage.m
//  ImageCache
//
//  Created by Nikolas Mayr on 2010-06-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OHImageCacheImage.h"

@implementation OHImageCacheImage

@synthesize _ohName, _ohImageCache;

-(void)dealloc {
    [_ohImageCache removeImage:_ohName];
    [super dealloc];
}

@end
