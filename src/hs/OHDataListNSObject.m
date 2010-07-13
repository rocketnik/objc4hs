#import "OHDataListNSObject.h"

#import "OHTuple.h"

@implementation NSObject (OHDataListNSObject)

// replicate :: Int -> a -> [a]
-(NSArray *)oh_replicate:(int)cnt {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:cnt];
    for (int i=0; i<cnt; ++i)
        [array addObject:self];
    return array;
}

// unfoldr :: (b -> Maybe (a, b)) -> b -> [a]
-(NSArray *)oh_unfoldr:(OHTuple *(^)(id b))f {
    NSMutableArray *array = [NSMutableArray array];
    id b = self;
    OHTuple *tup;
    while ((tup = f(b))) {
        [array addObject:tup.fst];
        b = tup.snd;
    }
    return array;
}

@end
