#import "OHAdditionsNSArray.h"

@implementation NSArray (OHAdditionsNSArray)

-(id)oh_firstObject {
    return ([self count])? [self objectAtIndex:0] : nil;
}

-(NSArray *)oh_sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor {
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];    
}

-(id)oh_initWithObject:(id)obj {
    return [[NSArray alloc] initWithObjects:obj,nil];
}

@end