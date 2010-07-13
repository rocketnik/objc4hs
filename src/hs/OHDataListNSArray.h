@class OHTuple;

@interface NSArray (OHDataListNSArray)

-(NSArray *)oh_plusPlus:(NSArray *)array;
-(id)oh_head;
-(id)oh_last;
-(NSArray *)oh_tail;
-(NSArray *)oh_init;
-(BOOL)on_null;
-(NSUInteger)oh_length;
-(NSArray *)oh_map:(id (^)(id))f;
-(NSArray *)oh_mapSel: (SEL)sel;
-(void     )oh_mapSel_:(SEL)sel;
-(NSArray *)oh_mapSel: (SEL)sel obj:(NSObject *)obj;
-(void     )oh_mapSel_:(SEL)sel obj:(NSObject *)obj;
-(NSArray *)oh_mapSel: (SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2;
-(void     )oh_mapSel_:(SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2;
-(NSArray *)oh_reverse;
-(NSArray *)oh_intersperse:(id)obj;
-(NSArray *)oh_intercalate:(NSArray *)arr;
-(NSArray *)oh_transpose;
-(NSArray *)oh_concat;
-(NSString *)oh_concatStr;
-(NSArray *)oh_concatMap:(NSArray * (^)(id))f;
-(BOOL)oh_and;
-(BOOL)oh_or;
-(BOOL)oh_any:(BOOL (^)(id))pred;
-(BOOL)oh_all:(BOOL (^)(id))pred;
-(double)oh_sumDouble;
-(float)oh_sumFloat;
-(int)oh_sumInt;
-(long)oh_sumLong;
-(long long)oh_sumLongLong;
-(short)oh_sumShort;
-(unsigned int)oh_sumUnsignedInt;
-(unsigned long)oh_sumUnsignedLong;
-(unsigned long long)oh_sumUnsignedLongLong;
-(unsigned short)oh_sumUnsignedShort;
-(double)oh_productDouble;
-(float)oh_productFloat;
-(int)oh_productInt;
-(long)oh_productLong;
-(long long)oh_productLongLong;
-(short)oh_productShort;
-(unsigned int)oh_productUnsignedInt;
-(unsigned long)oh_productUnsignedLong;
-(unsigned long long)oh_productUnsignedLongLong;
-(unsigned short)oh_productUnsignedShort;
-(id)maximum;
-(id)minimum;
-(NSArray *)oh_take:(int)cnt;
-(NSArray *)oh_drop:(int)cnt;
-(OHTuple *)oh_splitAt:(int)idx;
-(NSArray *)oh_takeWhile:(BOOL (^)(id))pred;
-(NSArray *)oh_dropWhile:(BOOL (^)(id))pred;
-(OHTuple *)oh_span:(BOOL(^)(id))pred;
-(OHTuple *)oh_break:(BOOL(^)(id))pred;
-(NSArray *)oh_groupByEquality;
-(NSArray *)oh_groupByPointer;
-(NSArray *)oh_groupByPropertyEquality:(SEL)sel;
-(NSArray *)oh_groupBy:(BOOL(^)(id a, id b))eq;
-(NSArray *)oh_inits;
-(NSArray *)oh_tails;
-(int)oh_elemIndex:(id)obj;
-(NSArray *)oh_nubByEquality;
-(NSArray *)oh_nubByPointer;
-(NSArray *)oh_nubBy:(BOOL(^)(id,id))eq;
-(BOOL)oh_elem:(id)obj by:(BOOL(^)(id,id))eq;


@end

