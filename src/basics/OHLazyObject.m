#import "OHLazyObject.h"

@implementation OHLazyObject

+(id)lazyObject:(OHFunction *)getter {
	OHLazyObject *lazyObj = [[[OHLazyObject alloc] initWith:getter] autorelease];
	return lazyObj;
}

-(id)initWith:(OHFunction *)getter {
	[super init];
	_getter = [getter retain];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearCache) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
	return self;
}

-(id)get {
	if (!_object) _object = [[_getter call] retain];
	return _object;
}

-(void)clearCache {
	[_object release]; _object = nil;
}

-(void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[_object release];
	[_getter release];
	[super dealloc];	
}

-(BOOL)isCached {
    return !!_object;
}

@end
