#import "OHTree.h"

#import "OHNSNullCatfromObj.h"
#import "OHMapZipCategories.h"
#import "OHNSArrayCatListOperations.h"
#import "OHNSArrayCatCatMaybes.h"

@implementation OHTree

@synthesize rootLabel, subForest;

+(id)tree {
    return [[[OHTree alloc] init] autorelease];
}

+(id)treeWithLabel:(id)label {
    OHTree *tree = [OHTree tree];
    tree.rootLabel = label;
    return tree;
}

+(id)treeWithLabel:(id)label subForest:(NSMutableArray *)forest {
    OHTree *tree = [OHTree treeWithLabel:label];
    tree.subForest = forest;
    return tree;
}

-(NSArray *)flatten {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[NSNull fromObj:self.rootLabel]];
    [array addObjectsFromArray:[[self.subForest mapSel:@selector(flatten)] concat]];
    return array;
}

// pseudo code
// filter :: (Tree a -> Bool) -> Tree a -> Maybe (Tree a)
// filter p t = if p t then Just Tree (rootLabel t) (catMaybes . map (filter p) . subForest $ t) else Nothing


-(OHTree *)filter:(NSPredicate *)predicate {
    OHTree *tree;
    if ([predicate evaluateWithObject:self]) {
        tree = [OHTree treeWithLabel:self.rootLabel];
        tree.subForest = [NSMutableArray arrayWithArray:[[self.subForest mapSel:@selector(filter) obj:predicate] catMaybes]];
    }
    return tree;
}

-(NSArray *)levels {
    NSMutableArray *array = [NSMutableArray array];
    
    assert(NO);
    return nil;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"Tree { rootLabel=%@, subForest=%@ }",self.rootLabel,self.subForest];
}

@end