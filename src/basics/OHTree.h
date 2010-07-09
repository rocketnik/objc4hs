#import <Foundation/Foundation.h>

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
-(NSArray *)levels;
-(OHTree *)filter:(NSPredicate *)predicate;

@end
