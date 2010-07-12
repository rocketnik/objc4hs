#import "OHDataListNSArray.h"
#import "OHDataListPrivateMacros.h"

#import "OHHelper.h"
#import "OHTuple.h"
#import "OHAdditionsFoundation.h"
#import "OHAdditionsNSNull.h"

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

//TODO transpose :: [[a]] -> [[a]]
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

//TODO maximum :: Ord a => [a] -> a
//TODO minimum :: Ord a => [a] -> a
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

//TODOspan :: (a -> Bool) -> [a] -> ([a], [a])
//TODObreak :: (a -> Bool) -> [a] -> ([a], [a])
//TODOstripPrefix :: Eq a => [a] -> [a] -> Maybe [a]
//group :: Eq a => [a] -> [[a]]
//TODOinits :: [a] -> [[a]]
//TODOtails :: [a] -> [[a]]
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
//delete :: Eq a => a -> [a] -> [a]
//(\\) :: Eq a => [a] -> [a] -> [a]
//union :: Eq a => [a] -> [a] -> [a]
//intersect :: Eq a => [a] -> [a] -> [a]
//TODOsort :: Ord a => [a] -> [a]
//insert :: Ord a => a -> [a] -> [a]
//nubBy :: (a -> a -> Bool) -> [a] -> [a]
//deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a]
//deleteFirstsBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
//unionBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
//intersectBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
//groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
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
