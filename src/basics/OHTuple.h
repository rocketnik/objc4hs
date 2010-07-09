#import "OHHelper.h"

@interface OHTuple : NSObject {
	id fst;
	id snd;
}

@property(nonatomic,retain) id fst;
@property(nonatomic,retain) id snd;

+(id)tuple;
+(id)tupleWith:(id)firstElement :(id)secondElement;
-(id)initWith: (id)firstElement :(id)secondElement;

@end
