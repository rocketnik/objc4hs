#import "OHTuple.h"

@implementation OHTuple

@synthesize fst,snd;

+(id)tuple {
    return [[[OHTuple alloc] init] autorelease];
}

+(id)tupleWith:(id)firstElement :(id)secondElement {
	OHTuple *tuple = [OHTuple tuple];
    tuple.fst = firstElement;
    tuple.snd = secondElement;
    return tuple;
}

-(id)initWith:(id)firstElement :(id)secondElement {
	[super init];
	self.fst = firstElement;
	self.snd = secondElement;
	return self;
}

-(void)dealloc {
	[fst release];
	[snd release];
	[super dealloc];
}

@end
