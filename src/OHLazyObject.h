#import "OHFunction.h"

@interface OHLazyObject : NSObject {
	id _object;
	OHFunction *_getter;
}

+(id)lazyObject:(OHFunction *)getter;

-(id)initWith:(OHFunction *)getter;

-(id)get;

// the cache is automatically cleared on a low memory condition
-(void)clearCache;

@end
