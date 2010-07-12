#import "OHAdditionsNSArray.h"

@implementation NSArray (OHAdditionsNSArray)

-(id)firstObject {
    return ([self count])? [self objectAtIndex:0] : nil;
}

//TODO should exist in OHDataMaybeNSArray
-(NSArray *)oh_catMaybes {
    return [self filteredArrayUsingPredicate:[NSCompoundPredicate notPredicateWithSubpredicate:[NSPredicate predicateWithFormat:@"isSubclassOfClass:[NSNull class]"]]];
}

@end