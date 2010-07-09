//
//  OHImageCacheImage.h
//  ImageCache
//
//  Created by Nikolas Mayr on 2010-06-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OHImageCacheImage : UIImage {
    NSString *_ohName;
    OHImageCache *_ohImageCache;
}

@property(nonatomic,retain) NSString *_ohName;
@property(nonatomic,retain) OHImageCache *_ohImageCache;

@end
