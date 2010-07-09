//
//  OHNSStringCat.m
//  Basics
//
//  Created by Nikolas Mayr on 2010-07-06.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OHNSStringCat.h"


@implementation NSString (OHNSStringCat)

-(NSString *)head {
    return [self substringToIndex:1];
}

@end
