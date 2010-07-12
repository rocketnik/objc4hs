#import "OHAdditionsNSNull.h"

@implementation NSNull (OHCatNSNull)

+(id)fromObj:obj {
	return (obj)? obj : [NSNull null];
}

@end
