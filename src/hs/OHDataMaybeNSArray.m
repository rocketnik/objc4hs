#import "OHDataMaybeNSArray.h"

@implementation NSArray (DataMaybeNSArray)

//listToMaybe :: [a] -> Maybe a
-(id)oh_listToMaybe {
    return ([self count])? [self objectAtIndex:0] : nil ;
}

//catMaybes :: [Maybe a] -> [a]
-(NSArray *)oh_catMaybes {
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self)
        if (![[self class] isSubclassOfClass:[NSNull class]])
            [array addObject:obj];
    return array;
    //alternative implementation
    //return [self filteredArrayUsingPredicate:[NSCompoundPredicate notPredicateWithSubpredicate:[NSPredicate predicateWithFormat:@"isSubclassOfClass:[NSNull class]"]]];
}

//mapMaybe :: (a -> Maybe b) -> [a] -> [b]
-(NSArray *)oh_mapMaybe:(id(^)(id))f {
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self) {
        id res = f(obj);
        if (res) [array addObject:res];
    }
    return array;
}

//isJust :: Maybe a -> Bool
//isNothing :: Maybe a -> Bool
//fromJust :: Maybe a -> a
//fromMaybe :: a -> Maybe a -> a
//maybeToList :: Maybe a -> [a]
//see DataMaybeNSObject

@end

