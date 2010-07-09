#import "OHLazyMutableArray.h"

@implementation OHLazyMutableArray

// TODO there is no designated initializer. copy and paste was used. maybe init is equal to initWithCapacity:0

-(id)init {
	[super init];
	array = [[NSMutableArray alloc] init];
	return self;
}

+(OHLazyMutableArray *)array {
	return [[[OHLazyMutableArray alloc] init] autorelease];
}

- (id)initWithCapacity:(NSUInteger)numItems {
    [super init];
    array = [[NSMutableArray alloc] initWithCapacity:numItems];
    return self;
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

-(void)printStatus {
    int cnt=0;
    int allCnt = [array count];
    for (int i=0; i<allCnt; ++i)
        if ([(OHLazyObject*)[array objectAtIndex:i] isCached]) ++cnt;
    printf("OHLazyMutableArray %d %d/%d objects cached\n",(int)self,cnt,allCnt);
}

@end
