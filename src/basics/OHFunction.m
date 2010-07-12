#import "OHFunction.h"

#import "OHTuple.h"

@interface OHFunction ()

+(id)evalSemicolon:(OHTuple *)tup;

+(OHFunction *)autoreleasedWithObj:(id)object sel:(SEL)selector par1:(id)parameter1 par2:(id)parameter2;

@end

@implementation OHFunction

+withObj:(id)object sel:(SEL)selector {
	OHFunction *cbf = [OHFunction autoreleasedWithObj:(id)object sel:(SEL)selector par1:nil par2:nil];
	cbf->parCnt = 0;
	return cbf;
}

+withObj:(id)object sel:(SEL)selector par:(id)parameter {
	OHFunction *cbf = [OHFunction autoreleasedWithObj:(id)object sel:(SEL)selector par1:parameter par2:nil];
	cbf->parCnt = 1;
	return cbf;
}

+withObj:(id)object sel:(SEL)selector par1:parameter1 par2:parameter2 {
	OHFunction *cbf = [OHFunction autoreleasedWithObj:(id)object sel:(SEL)selector par1:parameter1 par2:parameter2];
	cbf->parCnt = 2;
	return cbf;
}

+(OHFunction *)autoreleasedWithObj:(id)object sel:(SEL)selector par1:(id)parameter1 par2:(id)parameter2 {
	OHFunction *cbf = [[OHFunction alloc] init];
	cbf->obj = [object retain];
	cbf->sel = selector;
	cbf->par1 = [parameter1 retain];
	cbf->par2 = [parameter2 retain];
	return [cbf autorelease];
}

-(id)call {
	switch (parCnt) {
		case 2: return [obj performSelector:sel withObject:par1 withObject:par2];
		case 1: return [obj performSelector:sel withObject:par1];
		case 0: return [obj performSelector:sel];
		default: NSLog(@"ERROR: OHFunction: call: parametercount %d impossible",parCnt);
	}
	return nil;
}

-(OHFunction *)par:(id)parameter {
    OHFunction *newFunc = [self copy];
    [newFunc addPar:parameter];
    return newFunc;
}

-(void)addPar:(id)parameter {
    switch (parCnt) {
        case 0: par1 = [parameter retain]; break;
        case 1: par2 = [parameter retain]; break;
        default: NSLog(@"ERROR: OHFunction: par: too many parameters");
    }
    ++parCnt;
}

-(void)dealloc {
	[obj release];
	[par1 release];
	[par2 release];
	[super dealloc];
}

-(OHFunction *)semicolon:(OHFunction *)g {
	return [OHFunction withObj:[OHFunction class] sel:@selector(evalSemicolon:) par:[OHTuple tupleWith:self :g]];
}

+(id)evalSemicolon:(OHTuple *)tup {
	[[tup fst] call];
	return [[tup snd] call];
}

@end
