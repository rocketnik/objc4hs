@interface OHTree : NSObject {
    id rootLabel;
    NSMutableArray *subForest;
}

@property(nonatomic,retain) id rootLabel;
@property(nonatomic,retain) NSMutableArray *subForest;

+(id)tree;
+(id)treeWithLabel:(id)label;
+(id)treeWithLabel:(id)label subForest:(NSMutableArray *)forest;

-(NSArray *)flatten;
// TODO -(NSArray *)levels;
-(OHTree *)filter:(NSPredicate *)predicate;

@end
