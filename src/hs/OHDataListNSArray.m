#import "OHDataListNSArray.h"
#import "OHDataListPrivateMacros.h"

#import "OHHelper.h"
#import "OHTuple.h"
#import "OHAdditionsFoundation.h"
#import "OHAdditionsNSNull.h"

@interface NSArray (OHDataListNSArrayPrivate)

-(BOOL)oh_elem:(id)obj by:(BOOL(^)(id,id))eq;

@end

@implementation NSArray (OHDataListNSArray)

//(++) :: [a] -> [a] -> [a]
-(NSArray *)oh_plusPlus:(NSArray *)array {
    Use(@"- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray");
    return [self arrayByAddingObjectsFromArray:array];
}

//head :: [a] -> a
//for a save version see also: OHAdditionsNSArray -(id)firstObject
-(id)oh_head {
    return [self objectAtIndex:0];
}

//last :: [a] -> a
//for a save version see also NSArray -(id)lastObject
-(id)oh_last {
    return [self objectAtIndex:[self count]-1];
}

//tail :: [a] -> [a]
-(NSArray *)oh_tail {
    return [self subarrayWithRange:NSRangeMake(1,[self count]-1)];
}

//init :: [a] -> [a]
-(NSArray *)oh_init {
    return [self subarrayWithRange:NSRangeMake(0,[self count]-2)];
}

//null :: [a] -> Bool
-(BOOL)on_null {
    return ![self count];
}

//length :: [a] -> Int
-(NSUInteger)oh_length {
    Use(@"- (NSUInteger)count");
    return [self count];
}

//map :: (a -> b) -> [a] -> [b]
//don't forget to cast the return value to id when writing your block
-(NSArray *)oh_map:(id (^)(id))f {
    NSMutableArray *array = [NSMutableArray array];
    for (id object in self)
        [array addObject:f(object)];
    return array;
}

-(NSArray *)oh_mapSel: (SEL)sel {
	arrCap([self count]);
	foroIn(self)
    arrAddObj(perf2(o,sel));
	return array;
}

-(void     )oh_mapSel_:(SEL)sel {
    Use(@"- (void)makeObjectsPerformSelector:(SEL)aSelector");
	foroIn(self)
    perf2(o,sel);
}

-(NSArray *)oh_mapSel: (SEL)sel obj:(NSObject *)obj {
	arrCap([self count]);
	foroIn(self)
    arrAddObj(perf3(o,sel,obj));
	return array;
}

-(void     )oh_mapSel_:(SEL)sel obj:(NSObject *)obj {
    Use(@"- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)anObject");
	foroIn(self)
    perf3(o,sel,obj);
}

-(NSArray *)oh_mapSel: (SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2 {
	arrCap([self count]);
	foroIn(self)
    arrAddObj(perf4(o,sel,obj1,obj2));
	return array;
}

-(void     )oh_mapSel_:(SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2 {
	foroIn(self)
    perf4(o,sel,obj1,obj2);
}

//reverse :: [a] -> [a]
-(NSArray *)oh_reverse {
    NSMutableArray *array = [NSMutableArray array];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    id object;
    while ((object = [enumerator nextObject])) {
        [array addObject:object];
    }
    return array;
}

//intersperse :: a -> [a] -> [a]
-(NSArray *)oh_intersperse:(id)obj {
    NSMutableArray *array = [NSMutableArray array];
    int cnt = [self count] - 1;
    for (int i=0; i<cnt; ++i) {
        [array addObject:[self objectAtIndex:i]];
        [array addObject:obj];
    }
    [array addObject:[self lastObject]];
    return array;
}

//intercalate :: [a] -> [[a]] -> [a]
-(NSArray *)oh_intercalate:(NSArray *)arr {
    return [[self oh_intersperse:arr] oh_concat];
}

//transpose :: [[a]] -> [[a]]
-(NSArray *)oh_transpose {
    int cnt = [[[self oh_map:^(id arr){ return (id)[NSNumber numberWithInt:[(NSArray *)arr count]];}] minimum] intValue];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:cnt];
    for (int i=0; i<cnt; ++i)
        [array addObject:[self oh_mapSel:@selector(objectAtIndex:) obj:(id)i]];
    return array;
}

//TODO subsequences :: [a] -> [[a]]
//TODO permutations :: [a] -> [[a]]
//TODO foldl :: (a -> b -> a) -> a -> [b] -> a
//TODO foldl' :: (a -> b -> a) -> a -> [b] -> a
//TODO foldl1 :: (a -> a -> a) -> [a] -> a
//TODO foldl1' :: (a -> a -> a) -> [a] -> a
//TODO foldr :: (a -> b -> b) -> b -> [a] -> b
//TODO foldr1 :: (a -> a -> a) -> [a] -> a

//concat :: [[a]] -> [a]
-(NSArray *)oh_concat {
    NSMutableArray *array = [NSMutableArray array];
    int cnt = self.count;
    for (int i=0; i<cnt; ++i) {
        assert([[[self objectAtIndex:i] class] isSubclassOfClass:[NSArray class]]);
        [array addObjectsFromArray:[self objectAtIndex:i]];
    }
    return array;
}

-(NSString *)oh_concatStr {
    NSMutableString *string = [NSMutableArray string];
    for (NSString *str in self)
        [string appendString:str];
    return string;
}

//concatMap :: (a -> [b]) -> [a] -> [b]
-(NSArray *)oh_concatMap:(NSArray * (^)(id))f {
    return [[self oh_map:(id (^)(id))f] oh_concat];
}

//and :: [Bool] -> Bool
-(BOOL)oh_and {
    for (NSNumber *b in self)
        if (![b boolValue])
            return NO;
    return YES;
}

//or :: [Bool] -> Bool
-(BOOL)oh_or {
    for (NSNumber *b in self)
        if ([b boolValue])
            return YES;
    return NO;
}

//any :: (a -> Bool) -> [a] -> Bool
-(BOOL)oh_any:(BOOL (^)(id))pred {
    // could be written more compact but
    // would be slower due to lack of lazy evaluation
    for (id obj in self)
        if (pred(obj))
            return YES;
    return NO;
}

//all :: (a -> Bool) -> [a] -> Bool
-(BOOL)oh_all:(BOOL (^)(id))pred {
    // see comments for oh_any
    for (id obj in self)
        if (!pred(obj))
            return NO;
    return YES;
}

//sum :: Num a => [a] -> a
//TODO als fold schreiben
//TODO generisch schreiben mit funktion zum addieren
-(double)oh_sumDouble {
    double sum = 0;
    for (NSNumber *num in self)
        sum += [num doubleValue];
    return sum;
}

-(float)oh_sumFloat {
    float sum = 0;
    for (NSNumber *num in self)
        sum += [num floatValue];
    return sum;
}

-(int)oh_sumInt {
    int sum = 0;
    for (NSNumber *num in self)
        sum += [num intValue];
    return sum;
}

-(long)oh_sumLong {
    long sum = 0;
    for (NSNumber *num in self)
        sum += [num longValue];
    return sum;
}

-(long long)oh_sumLongLong {
    long long sum = 0;
    for (NSNumber *num in self)
        sum += [num longLongValue];
    return sum;
}

-(short)oh_sumShort {
    short sum = 0;
    for (NSNumber *num in self)
        sum += [num shortValue];
    return sum;
}

-(unsigned int)oh_sumUnsignedInt {
    unsigned int sum = 0;
    for (NSNumber *num in self)
        sum += [num unsignedIntValue];
    return sum;
}

-(unsigned long)oh_sumUnsignedLong {
    unsigned long sum = 0;
    for (NSNumber *num in self)
        sum += [num unsignedLongValue];
    return sum;
}

-(unsigned long long)oh_sumUnsignedLongLong {
    unsigned long long sum = 0;
    for (NSNumber *num in self)
        sum += [num unsignedLongLongValue];
    return sum;
}

-(unsigned short)oh_sumUnsignedShort {
    unsigned short sum = 0;
    for (NSNumber *num in self)
        sum += [num unsignedShortValue];
    return sum;
}

//product :: Num a => [a] -> a
-(double)oh_productDouble {
    double product = 1;
    for (NSNumber *num in self)
        product *= [num doubleValue];
    return product;
}

-(float)oh_productFloat {
    float product = 1;
    for (NSNumber *num in self)
        product *= [num floatValue];
    return product;
}

-(int)oh_productInt {
    int product = 1;
    for (NSNumber *num in self)
        product *= [num intValue];
    return product;
}

-(long)oh_productLong {
    long product = 1;
    for (NSNumber *num in self)
        product *= [num longValue];
    return product;
}

-(long long)oh_productLongLong {
    long long product = 1;
    for (NSNumber *num in self)
        product *= [num longLongValue];
    return product;
}

-(short)oh_productShort {
    short product = 1;
    for (NSNumber *num in self)
        product *= [num shortValue];
    return product;
}

-(unsigned int)oh_productUnsignedInt {
    unsigned int product = 1;
    for (NSNumber *num in self)
        product *= [num unsignedIntValue];
    return product;
}

-(unsigned long)oh_productUnsignedLong {
    unsigned long product = 1;
    for (NSNumber *num in self)
        product *= [num unsignedLongValue];
    return product;
}

-(unsigned long long)oh_productUnsignedLongLong {
    unsigned long long product = 1;
    for (NSNumber *num in self)
        product *= [num unsignedLongLongValue];
    return product;
}

-(unsigned short)oh_productUnsignedShort {
    unsigned short product = 1;
    for (NSNumber *num in self)
        product *= [num unsignedShortValue];
    return product;
}

//maximum :: Ord a => [a] -> a
//compare method needs to be implemented, wich is the case for NSNumber and NSString
-(id)maximum {
    int cnt = [self count];
    id max = [self objectAtIndex:0];
    for (int i=1; i<cnt; ++i) {
        id cur = [self objectAtIndex:i];
        if ([cur compare:max]>0)
            max = cur;
    }
    return max;
}

//minimum :: Ord a => [a] -> a
//see comment for maximum
-(id)minimum {
    id min = [self objectAtIndex:0];
    int cnt = [self count];
    for (int i=1; i<cnt; ++i) {
        id cur = [self objectAtIndex:i];
        if ([cur compare:min]<0)
            min = cur;
    }
    return min;
}
//TODO scanl :: (a -> b -> a) -> a -> [b] -> [a]
//TODO scanl1 :: (a -> a -> a) -> [a] -> [a]
//TODO scanr :: (a -> b -> b) -> b -> [a] -> [b]
//TODOscanr1 :: (a -> a -> a) -> [a] -> [a]
//TODOmapAccumL :: (acc -> x -> (acc, y)) -> acc -> [x] -> (acc, [y])
//TODOmapAccumR :: (acc -> x -> (acc, y)) -> acc -> [x] -> (acc, [y])
//TODOiterate :: (a -> a) -> a -> [a]
//TODOrepeat :: a -> [a]
//TODOreplicate :: Int -> a -> [a]
//TODOcycle :: [a] -> [a]
//TODOunfoldr :: (b -> Maybe (a, b)) -> b -> [a]

//take :: Int -> [a] -> [a]
-(NSArray *)oh_take:(int)cnt {
    if (cnt>[self count])
        return [NSArray arrayWithArray:self];
    else {
        NSMutableArray *array = [NSMutableArray array];
        for (int i=0; i<cnt; ++i)
            [array addObject:[self objectAtIndex:i]];
        return array;
    }
}

//drop :: Int -> [a] -> [a]
-(NSArray *)oh_drop:(int)cnt {
    int maxCnt = [self count];
    NSMutableArray *array = [NSMutableArray array];
    for (int i=cnt; i<maxCnt; ++i)
        [array addObject:[self objectAtIndex:i]];
    return array;
}

//splitAt :: Int -> [a] -> ([a], [a])
-(OHTuple *)oh_splitAt:(int)idx {
    return [OHTuple tupleWith:[self oh_take:idx] :[self oh_drop:idx]];
}

//takeWhile :: (a -> Bool) -> [a] -> [a]
-(NSArray *)oh_takeWhile:(BOOL (^)(id))pred {
    NSMutableArray *array = [NSMutableArray array];
    int cnt = [self count];
    for (int i=0; i<cnt; ++i) {
        id obj = [self objectAtIndex:i];
        if (!pred(obj)) break;
        [array addObject:obj];
    }
    return array;
}

//dropWhile :: (a -> Bool) -> [a] -> [a]
-(NSArray *)oh_dropWhile:(BOOL (^)(id))pred {
    int cnt = [self count];
    int i;
    for (i=0; i<cnt; ++i) {
        id obj = [self objectAtIndex:i];
        if (!pred(obj)) break;
    }
    return [self oh_drop:i];
}

//span :: (a -> Bool) -> [a] -> ([a], [a])
-(OHTuple *)oh_span:(BOOL(^)(id))pred {
    return [OHTuple tupleWith:[self oh_takeWhile:pred] :[self oh_dropWhile:pred]];
}

//break :: (a -> Bool) -> [a] -> ([a], [a])
-(OHTuple *)oh_break:(BOOL(^)(id))pred {
    return [self oh_span:^(id obj){ return (BOOL)!pred(obj);}];
}

//TODOstripPrefix :: Eq a => [a] -> [a] -> Maybe [a]

//group :: Eq a => [a] -> [[a]]
//you may want to use [NSSet setWithArray:array] instead
-(NSArray *)oh_groupByEquality {
    return [self oh_groupBy:^(id a, id b) { return [a isEqual:b];}];
}

-(NSArray *)oh_groupByPointer {
    return [self oh_groupBy:^(id a, id b) { return (BOOL)(a == b);}];
}

-(NSArray *)oh_groupByPropertyEquality:(SEL)sel {
    return [self oh_groupBy:^(id a, id b) { return [[a performSelector:sel] isEqual:[b performSelector:sel]];}];
}

//groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
//TODO der code sieht beschämend aus. wie wäre es mit addobj, das das array zurückliefert
// ausserdem verbrauchen wir durch die rekursiv angelegten arrays viel zu viel speicher
-(NSArray *)oh_groupBy:(BOOL(^)(id a, id b))eq {
    if (![self count]) {
        return [NSArray array];
    }
    else {
        id x = [self oh_head];
        NSArray *xs = [self oh_tail];
        OHTuple *tup = [xs oh_span:^(id a){return eq(x,a);}];
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:x];
        [array addObjectsFromArray:tup.fst];
        [array addObjectsFromArray:[tup.snd oh_groupBy:eq]];
        return array;
    }
}

//inits :: [a] -> [[a]]
-(NSArray *)oh_inits {
    int cnt = [self count];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:cnt];
    for (int j=0; j<=cnt; ++j) {
        NSMutableArray *subArr = [NSMutableArray arrayWithCapacity:j];
        for (int i=0; i<j; ++i)
            [subArr addObject:[self objectAtIndex:i]];
        [array addObject:subArr];
    }
    return array;
}

//tails :: [a] -> [[a]]
-(NSArray *)oh_tails {
    int cnt = [self count];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:cnt];
    for (int j=0; j<cnt; ++j) {
        NSMutableArray *subArray = [NSMutableArray arrayWithCapacity:cnt-j];
        for (int i=j; i<cnt; ++i)
            [subArray addObject:[self objectAtIndex:i]];
        [array addObject:subArray];
    }
    return array;
}

//TODOisPrefixOf :: Eq a => [a] -> [a] -> Bool
//TODOisSuffixOf :: Eq a => [a] -> [a] -> Bool
//TODOisInfixOf :: Eq a => [a] -> [a] -> Bool
//elem :: Eq a => a -> [a] -> Bool
//notElem :: Eq a => a -> [a] -> Bool
//TODOlookup :: Eq a => a -> [(a, b)] -> Maybe b
//find :: (a -> Bool) -> [a] -> Maybe a
//filter :: (a -> Bool) -> [a] -> [a]
//partition :: (a -> Bool) -> [a] -> ([a], [a])
//(!!) :: [a] -> Int -> a
//elemIndex :: Eq a => a -> [a] -> Maybe Int
-(int)oh_elemIndex:(id)obj {
    int cnt = [self count];
    int i;
    for (i=0; i<cnt; ++i) {
        if ([self objectAtIndex:i] == obj)
            break;
    }
    return (i<cnt)? i : -1;
}
//elemIndices :: Eq a => a -> [a] -> [Int]
//findIndex :: (a -> Bool) -> [a] -> Maybe Int
//findIndices :: (a -> Bool) -> [a] -> [Int]
//zip :: [a] -> [b] -> [(a, b)]
//TODOzip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
//TODOzip4 :: [a] -> [b] -> [c] -> [d] -> [(a, b, c, d)]
//TODOzip5 :: [a] -> [b] -> [c] -> [d] -> [e] -> [(a, b, c, d, e)]
//TODOzip6 :: [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [(a, b, c, d, e, f)]
//TODOzip7 :: [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g] -> [(a, b, c, d, e, f, g)]
//zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
//zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
//zipWith4 :: (a -> b -> c -> d -> e) -> [a] -> [b] -> [c] -> [d] -> [e]
//zipWith5 :: (a -> b -> c -> d -> e -> f) -> [a] -> [b] -> [c] -> [d] -> [e] -> [f]
//zipWith6 :: (a -> b -> c -> d -> e -> f -> g) -> [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g]
//zipWith7 :: (a -> b -> c -> d -> e -> f -> g -> h) -> [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g] -> [h]
//unzip :: [(a, b)] -> ([a], [b])
//TODOunzip3 :: [(a, b, c)] -> ([a], [b], [c])
//TODOunzip4 :: [(a, b, c, d)] -> ([a], [b], [c], [d])
//TODOunzip5 :: [(a, b, c, d, e)] -> ([a], [b], [c], [d], [e])
//TODOunzip6 :: [(a, b, c, d, e, f)] -> ([a], [b], [c], [d], [e], [f])
//TODOunzip7 :: [(a, b, c, d, e, f, g)] -> ([a], [b], [c], [d], [e], [f], [g])
//lines :: String -> [String]
//words :: String -> [String]
//unlines :: [String] -> String
//unwords :: [String] -> String

//nub :: Eq a => [a] -> [a]
-(NSArray *)oh_nubByEquality {
    return [self oh_nubBy:^(id a, id b){return [a isEqual:b];}];
}

-(NSArray *)oh_nubByPointer {
    return [self oh_nubBy:^(id a, id b){return (BOOL)(a == b);}];
}

-(NSArray *)oh_nubByPropertyEquality:(SEL)sel {
    return [self oh_nubBy:^(id a, id b){return [[a performSelector:sel] isEqual:[b performSelector:sel]];}];
}

//nubBy :: (a -> a -> Bool) -> [a] -> [a]
-(NSArray *)oh_nubBy:(BOOL(^)(id,id))eq {
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self)
        if (![array oh_elem:obj by:eq])
            [array addObject:obj];
    return array;
}

//elem_by :: (a -> a -> Bool) -> a -> [a] -> Bool
-(BOOL)oh_elem:(id)obj by:(BOOL(^)(id,id))eq {
    for (id o in self)
        if(eq(obj,o)) return YES;
    return NO;
}

//delete :: Eq a => a -> [a] -> [a]
//(\\) :: Eq a => [a] -> [a] -> [a]
//union :: Eq a => [a] -> [a] -> [a]
//intersect :: Eq a => [a] -> [a] -> [a]
//TODOsort :: Ord a => [a] -> [a]
//wir brauchen eine implementierung von sort, die stable ist (die elemente nicht vertauscht)
//insert :: Ord a => a -> [a] -> [a]
//deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a]
//deleteFirstsBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
//unionBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
//intersectBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
//sortBy :: (a -> a -> Ordering) -> [a] -> [a]
//insertBy :: (a -> a -> Ordering) -> a -> [a] -> [a]
//maximumBy :: (a -> a -> Ordering) -> [a] -> a
//minimumBy :: (a -> a -> Ordering) -> [a] -> a
//genericLength :: Num i => [b] -> i
//genericTake :: Integral i => i -> [a] -> [a]
//genericDrop :: Integral i => i -> [a] -> [a]
//genericSplitAt :: Integral i => i -> [b] -> ([b], [b])
//genericIndex :: Integral a => [b] -> a -> b
//TODOgenericReplicate :: Integral i => i -> a -> [a]

@end
