@implementation NSArray (OHNSArrayCatListOperations)

-(NSArray *)concat {
    NSMutableArray *array = [NSMutableArray array];
    int cnt = self.count;
    for (int i=0; i<cnt; ++i) {
        assert([[[self objectAtIndex:i] class] isSubclassOfClass:[NSArray class]]);
        [array addObjectsFromArray:[self objectAtIndex:i]];
    }
    return array;
}

@end
