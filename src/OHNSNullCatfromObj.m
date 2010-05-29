#import "OHNSNullCatfromObj.h"

@implementation NSNull (OHNSNullCatfromObj)

+(id)fromObj:obj {
	return (obj)? obj : [NSNull null];
}

@end
