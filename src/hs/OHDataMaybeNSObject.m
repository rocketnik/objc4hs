#import "OHDataMaybeNSObject.h"

@implementation NSObject (DataMaybeNSObject)

//maybe :: b -> (a -> b) -> Maybe a -> b
+(id)oh_maybeFallback:(id)fallback function:(id(^)(id))f value:(id)value {
    return (value)? f(value) : fallback ;
}

//fromMaybe :: a -> Maybe a -> a
+(id)oh_fromMaybe:(id)fallback value:(id)value {
    return (value)? value : fallback ;
}

//maybeToList :: Maybe a -> [a]
+(NSArray *)oh_maybeToListNSArray:(id)obj {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:!!obj];
    if (obj) [array addObject:obj];
    return array;
}

+(NSSet *)oh_maybeToListNSSet:(id)obj {
    NSMutableSet *set = [NSMutableSet setWithCapacity:!!obj];
    if (obj) [set addObject:obj];
    return set;
}

//isJust :: Maybe a -> Bool
//isNothing :: Maybe a -> Bool
//fromJust :: Maybe a -> a
//implementation pointless as long as there is no special class for maybe

//listToMaybe :: [a] -> Maybe a
//catMaybes :: [Maybe a] -> [a]
//mapMaybe :: (a -> Maybe b) -> [a] -> [b]
//not neede here

@end
