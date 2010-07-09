#import "OHNSArrayCat.h"


@implementation NSArray (OHNSArrayCat)

-(id)firstObject {
    return ([self count])? [self objectAtIndex:0] : nil;
}

@end



@implementation NSArray (OHNSArrayCatCatMaybes)

-(NSArray *)concat {
    NSMutableArray *array = [NSMutableArray array];
    int cnt = self.count;
    for (int i=0; i<cnt; ++i) {
        assert([[[self objectAtIndex:i] class] isSubclassOfClass:[NSArray class]]);
        [array addObjectsFromArray:[self objectAtIndex:i]];
    }
    return array;
}

-(NSArray *)mapSel:(SEL)sel {
    int cnt = self.count;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:cnt];
    for (int i=0; i<cnt; ++i) {
        id res = [[self objectAtIndex:i] performSelector:sel];
        assert(res);
        [array addObject:res];
    }
    return array;
}

-(NSArray *)mapSel:(SEL)sel obj:(id)obj {
    int cnt = self.count;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:cnt];
    for (int i=0; i<cnt; ++i) {
        id res = [[self objectAtIndex:i] performSelector:sel withObject:obj];
        assert(res);
        [array addObject:res];
    }
    return array;
}

-(NSArray *)catMaybes {
    return [self filteredArrayUsingPredicate:[NSCompoundPredicate notPredicateWithSubpredicate:[NSPredicate predicateWithFormat:@"isSubclassOfClass:[NSNull class]"]]];
}

-(BOOL)all {
    BOOL res = YES;
    for (NSNumber *b in self)
        if (![b boolValue]) {
            res = NO;
            break; }
    return res;
}

-(BOOL)any {
    BOOL res = NO;
    for (NSNumber *b in self)
        if ([b boolValue]) {
            res = YES;
            break; }
    return res;
}

-(NSArray *)groupBy:(NSString *)fieldName {
    NSMutableArray *result = [NSMutableArray array];
    for (id groupId in [[self mapSel:@selector(valueForKey:) obj:fieldName] nub]) {
        NSMutableArray *group = [NSMutableArray array];
        for (id elem in self) {
            if ([[elem valueForKey:fieldName] isEqual:groupId])
                [group addObject:elem];
        }
        [result addObject:group];
    }
    return result;
}

-(NSArray *)nub {
    NSMutableArray *result = [NSMutableArray array];
    for (id obj in self)
        if (![result containsObject: obj])
            [result addObject: obj];
    return result;
}

-(id)initWithObject:(id)obj {
    return [[NSArray alloc] initWithObjects:obj,nil];
}

-(NSArray *)sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor {
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];    
}

-(id)firstObject {
    return [self objectAtIndex:0];
}

-(NSArray *)tail {
    NSMutableArray *array = [NSMutableArray array];
    int cnt = [self count];
    for (int i=1; i<cnt; ++i)
        [array addObject:[self objectAtIndex:i]];
    return array;
}

-(int)objPos:(id)obj {
    int cnt = [self count];
    int i;
    for (i=0; i<cnt; ++i) {
        if ([self objectAtIndex:i] == obj)
            break;
    }
    return (i<cnt)? i : -1;
}

@end
