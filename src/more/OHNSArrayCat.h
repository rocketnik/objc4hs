#import <Foundation/Foundation.h>

@interface NSArray (OHNSArrayCat)

-(NSString *)strConcat {
    NSMutableString *string = [NSMutableString string];
    for (NSString *str in self)
        [string appendString:str];
    return string;
}

-(NSArray *)arrayByAppendingArray:(NSArray *)array;
-(id)head;
-(id)last;
-(id)tail;
-(id)init_;
-(id)null;
-(int)length;
//map
-(NSArray *)reverse;
-(NSArray *)intersperseObj:(id)obj;
//intercalate
//transpose;
//subsequences;
//permutations
//foldl
//foldl'
//foldl1
//foldl1'
//foldr
//foldr1
-(NSArray *)concat;
//concatMap
-(BOOL)and_;
-(BOOL)or_;
//any
//all
//sum
//product
//maximum
//minimum
//scanl
//scanl1
//scanr
//scanr1
//mapAccumL
//mapAccumR
//iterate
//repeat
+(NSArray *)replicate:(id)obj;
//cycle
//unfoldr
-(NSArray *)take:(int)cnt;
-(NSArray *)drop:(int)cnt;
-(OHTuple *)splitAt:(int)idx;
-(NSArray *)takeWhile:(SEL)sel; // sel :: (a -> Bool)
-(NSArray *)dropWhile:(SEL)sel;
-(OHTuple *)span:(SEL)sel;
-(OHTuple *)break_:(SEL)sel;
-(NSArray *)stripPrefix:(NSArray *)prefix // returns nil, if the prefix was not in the array
-(NSArray *)group;
//inits
//tails
//isPrefixOf
//isSuffixOf
//isInfixOf
-(BOOL)elem:(id)obj;
-(BOOL)notElem:(id)obj;
//lookup
//find
//filter
-(OHTuple *)partition;
-(int)elemIndex:(id)obj;
//-(NSNumber *)elemIndex_NSNumber:(id)obj;
//-(NSArray *)elemIndices:(id)obj;


lookup :: Eq a => a -> [(a, b)] -> Maybe b
find :: (a -> Bool) -> [a] -> Maybe a
filter :: (a -> Bool) -> [a] -> [a]
partition :: (a -> Bool) -> [a] -> ([a], [a])
(!!) :: [a] -> Int -> a
elemIndex :: Eq a => a -> [a] -> Maybe Int
elemIndices :: Eq a => a -> [a] -> [Int]
findIndex :: (a -> Bool) -> [a] -> Maybe Int
findIndices :: (a -> Bool) -> [a] -> [Int]
zip :: [a] -> [b] -> [(a, b)]
zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
zip4 :: [a] -> [b] -> [c] -> [d] -> [(a, b, c, d)]
zip5 :: [a] -> [b] -> [c] -> [d] -> [e] -> [(a, b, c, d, e)]
zip6 :: [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [(a, b, c, d, e, f)]
zip7 :: [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g] -> [(a, b, c, d, e, f, g)]
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
zipWith4 :: (a -> b -> c -> d -> e) -> [a] -> [b] -> [c] -> [d] -> [e]
zipWith5 :: (a -> b -> c -> d -> e -> f) -> [a] -> [b] -> [c] -> [d] -> [e] -> [f]
zipWith6 :: (a -> b -> c -> d -> e -> f -> g) -> [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g]
zipWith7 :: (a -> b -> c -> d -> e -> f -> g -> h) -> [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g] -> [h]
unzip :: [(a, b)] -> ([a], [b])
unzip3 :: [(a, b, c)] -> ([a], [b], [c])
unzip4 :: [(a, b, c, d)] -> ([a], [b], [c], [d])
unzip5 :: [(a, b, c, d, e)] -> ([a], [b], [c], [d], [e])
unzip6 :: [(a, b, c, d, e, f)] -> ([a], [b], [c], [d], [e], [f])
unzip7 :: [(a, b, c, d, e, f, g)] -> ([a], [b], [c], [d], [e], [f], [g])
lines :: String -> [String]
words :: String -> [String]
unlines :: [String] -> String
unwords :: [String] -> String
nub :: Eq a => [a] -> [a]
delete :: Eq a => a -> [a] -> [a]
(\\) :: Eq a => [a] -> [a] -> [a]
union :: Eq a => [a] -> [a] -> [a]
intersect :: Eq a => [a] -> [a] -> [a]
sort :: Ord a => [a] -> [a]
insert :: Ord a => a -> [a] -> [a]
nubBy :: (a -> a -> Bool) -> [a] -> [a]
deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a]
deleteFirstsBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
unionBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
intersectBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
sortBy :: (a -> a -> Ordering) -> [a] -> [a]
insertBy :: (a -> a -> Ordering) -> a -> [a] -> [a]
maximumBy :: (a -> a -> Ordering) -> [a] -> a
minimumBy :: (a -> a -> Ordering) -> [a] -> a
genericLength :: Num i => [b] -> i
genericTake :: Integral i => i -> [a] -> [a]
genericDrop :: Integral i => i -> [a] -> [a]
genericSplitAt :: Integral i => i -> [b] -> ([b], [b])
genericIndex :: Integral a => [b] -> a -> b
genericReplicate :: Integral i => i -> a -> [a]




















-(NSArray *)concat;
-(NSArray *)mapSel:(SEL)sel;
-(NSArray *)mapSel:(SEL)sel obj:(id)obj;
-(NSArray *)catMaybes;
-(BOOL)all;
-(BOOL)any;
-(NSArray *)groupBy:(NSString *)fieldName;
-(NSArray *)nub;
-(id)initWithObject:(id)obj;
-(NSArray *)sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor;
-(id)firstObject;
-(NSArray *)tail;
-(int)objPos:(id)obj;

@end
