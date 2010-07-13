@class OHTuple;

@interface NSObject (OHDataListNSObject)

-(NSArray *)oh_replicate:(int)cnt;
-(NSArray *)oh_unfoldr:(OHTuple *(^)(id b))f;

@end
