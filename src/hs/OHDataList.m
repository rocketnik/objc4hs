//Haskell: Data.List

#import "OHDataList.h"

#import "OHHelper.h"

@implementation NSObject (OHDataList)

//map :: (a -> b) -> [a] -> [b]
//blocks

@end


@implementation NSString (OHDataList)

//(++) :: [a] -> [a] -> [a]
-(NSString *)oh_plusPlus:(NSString *)string {
    Use(@"- (NSString *)stringByAppendingString:(NSString *)aString");
    return [self stringByAppendingString:string];
}

//head :: [a] -> a
-(unichar)oh_head {
    return [self characterAtIndex:0];
}

//last :: [a] -> a
-(unichar)oh_last {
    return [self characterAtindex:[self length]-1];
}

//tail :: [a] -> [a]
-(NSString *)oh_tail {
    return [self substringFromIndex:1];
}

//init :: [a] -> [a]
-(NSString *)oh_init {
    return [self subStringToIndex:[self length]-2];
}

//null :: [a] -> Bool
-(BOOL)oh_null {
    return ![self length];
}

//length :: [a] -> Int
-(NSUInteger)oh_length {
    Use(@"- (NSUInteger)length");
    return [self length];
}

//map :: (a -> b) -> [a] -> [b]
//blocks

@end


@implementation NSArray (OHDataList)

//(++) :: [a] -> [a] -> [a]
-(NSArray *)oh_plusPlus:(NSArray *)array {
    Use(@"- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray");
    return [self arrayByAddingObjectsFromArray:array];
}

//head :: [a] -> a
//for a save version see also: OHNSArrayCat -(id)firstObject
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
//blocks

@end

// weitere array extensions

@implementation NSArray (OHNSArrayCat)

-(id)firstObject {
    return ([self count])? [self objectAtIndex:0] : nil;
}

@end




//reverse :: [a] -> [a]
//intersperse :: a -> [a] -> [a]
//intercalate :: [a] -> [[a]] -> [a]
//transpose :: [[a]] -> [[a]]
//subsequences :: [a] -> [[a]]
//permutations :: [a] -> [[a]]
//foldl :: (a -> b -> a) -> a -> [b] -> a
//foldl' :: (a -> b -> a) -> a -> [b] -> a
//foldl1 :: (a -> a -> a) -> [a] -> a
//foldl1' :: (a -> a -> a) -> [a] -> a
//foldr :: (a -> b -> b) -> b -> [a] -> b
//foldr1 :: (a -> a -> a) -> [a] -> a
//concat :: [[a]] -> [a]
//concatMap :: (a -> [b]) -> [a] -> [b]
//and :: [Bool] -> Bool
//or :: [Bool] -> Bool
//any :: (a -> Bool) -> [a] -> Bool
//all :: (a -> Bool) -> [a] -> Bool
//sum :: Num a => [a] -> a
//product :: Num a => [a] -> a
//maximum :: Ord a => [a] -> a
//minimum :: Ord a => [a] -> a
//scanl :: (a -> b -> a) -> a -> [b] -> [a]
//scanl1 :: (a -> a -> a) -> [a] -> [a]
//scanr :: (a -> b -> b) -> b -> [a] -> [b]
//scanr1 :: (a -> a -> a) -> [a] -> [a]
//mapAccumL :: (acc -> x -> (acc, y)) -> acc -> [x] -> (acc, [y])
//mapAccumR :: (acc -> x -> (acc, y)) -> acc -> [x] -> (acc, [y])
//iterate :: (a -> a) -> a -> [a]
//repeat :: a -> [a]
//replicate :: Int -> a -> [a]
//cycle :: [a] -> [a]
//unfoldr :: (b -> Maybe (a, b)) -> b -> [a]
//take :: Int -> [a] -> [a]
//drop :: Int -> [a] -> [a]
//splitAt :: Int -> [a] -> ([a], [a])
//takeWhile :: (a -> Bool) -> [a] -> [a]
//dropWhile :: (a -> Bool) -> [a] -> [a]
//span :: (a -> Bool) -> [a] -> ([a], [a])
//break :: (a -> Bool) -> [a] -> ([a], [a])
//stripPrefix :: Eq a => [a] -> [a] -> Maybe [a]
//group :: Eq a => [a] -> [[a]]
//inits :: [a] -> [[a]]
//tails :: [a] -> [[a]]
//isPrefixOf :: Eq a => [a] -> [a] -> Bool
//isSuffixOf :: Eq a => [a] -> [a] -> Bool
//isInfixOf :: Eq a => [a] -> [a] -> Bool
//elem :: Eq a => a -> [a] -> Bool
//notElem :: Eq a => a -> [a] -> Bool
//lookup :: Eq a => a -> [(a, b)] -> Maybe b
//find :: (a -> Bool) -> [a] -> Maybe a
//filter :: (a -> Bool) -> [a] -> [a]
//partition :: (a -> Bool) -> [a] -> ([a], [a])
//(!!) :: [a] -> Int -> a
//elemIndex :: Eq a => a -> [a] -> Maybe Int
//elemIndices :: Eq a => a -> [a] -> [Int]
//findIndex :: (a -> Bool) -> [a] -> Maybe Int
//findIndices :: (a -> Bool) -> [a] -> [Int]
//zip :: [a] -> [b] -> [(a, b)]
//zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
//zip4 :: [a] -> [b] -> [c] -> [d] -> [(a, b, c, d)]
//zip5 :: [a] -> [b] -> [c] -> [d] -> [e] -> [(a, b, c, d, e)]
//zip6 :: [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [(a, b, c, d, e, f)]
//zip7 :: [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g] -> [(a, b, c, d, e, f, g)]
//zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
//zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
//zipWith4 :: (a -> b -> c -> d -> e) -> [a] -> [b] -> [c] -> [d] -> [e]
//zipWith5 :: (a -> b -> c -> d -> e -> f) -> [a] -> [b] -> [c] -> [d] -> [e] -> [f]
//zipWith6 :: (a -> b -> c -> d -> e -> f -> g) -> [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g]
//zipWith7 :: (a -> b -> c -> d -> e -> f -> g -> h) -> [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g] -> [h]
//unzip :: [(a, b)] -> ([a], [b])
//unzip3 :: [(a, b, c)] -> ([a], [b], [c])
//unzip4 :: [(a, b, c, d)] -> ([a], [b], [c], [d])
//unzip5 :: [(a, b, c, d, e)] -> ([a], [b], [c], [d], [e])
//unzip6 :: [(a, b, c, d, e, f)] -> ([a], [b], [c], [d], [e], [f])
//unzip7 :: [(a, b, c, d, e, f, g)] -> ([a], [b], [c], [d], [e], [f], [g])
//lines :: String -> [String]
//words :: String -> [String]
//unlines :: [String] -> String
//unwords :: [String] -> String
//nub :: Eq a => [a] -> [a]
//delete :: Eq a => a -> [a] -> [a]
//(\\) :: Eq a => [a] -> [a] -> [a]
//union :: Eq a => [a] -> [a] -> [a]
//intersect :: Eq a => [a] -> [a] -> [a]
//sort :: Ord a => [a] -> [a]
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
//genericReplicate :: Integral i => i -> a -> [a]
