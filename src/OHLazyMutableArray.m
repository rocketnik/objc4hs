#import "OHLazyMutableArray.h"

@implementation OHLazyMutableArray

-(id)init {
	[super init];
	array = [[NSMutableArray alloc] init];
	return self;
}

+(OHLazyMutableArray *)array {
	return [[[OHLazyMutableArray alloc] init] autorelease];
}

- (void)insertObject:(OHFunction *)function atIndex:(NSUInteger)index {
	[array insertObject:[OHLazyObject lazyObject:function] atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
	[array removeObjectAtIndex:index];
}

- (void)addObject:(OHFunction *)function {
	[array addObject:[OHLazyObject lazyObject:function]];
}

- (void)removeLastObject {
	[array removeLastObject];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(OHFunction *)function {
	[array replaceObjectAtIndex:index withObject:[OHLazyObject lazyObject:function]];
}

- (NSUInteger)count {
	return [array count];
}

- (id)objectAtIndex:(NSUInteger)index {
	return [[array objectAtIndex:index] get];
}

-(void)clearCache {
	[array makeObjectsPerformSelector:@selector(clearCache)];
}

-(void)dealloc {
	[array release];
	[super dealloc];	
}

@end
