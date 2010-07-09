#import "OHLazyObject.h"

@interface OHLazyMutableArray : NSMutableArray {
	NSMutableArray *array;
}

-(id)init;
+(OHLazyMutableArray *)array;

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

- (void)insertObject:(OHFunction *)function atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)addObject:(OHFunction *)function;
- (void)removeLastObject;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(OHFunction *)function;

// the cache is internally automatically cleared on a low memory condition
-(void)clearCache;

-(void)printStatus;

@end
