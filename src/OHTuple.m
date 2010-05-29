#import "OHTuple.h"

@implementation OHTuple

@synthesize fst,snd;

+(id)tuple:(id)firstElement :(id)secondElement {
	return [[[OHTuple alloc] initWith:firstElement :secondElement] autorelease];
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
