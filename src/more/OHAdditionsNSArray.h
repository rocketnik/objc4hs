

@interface NSArray (OHAdditionsNSArray)

-(id)oh_firstObject;
-(NSArray *)oh_sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor;
-(id)oh_initWithObject:(id)obj;

@end
