@interface NSArray (DataMaybeNSArray)

-(id)oh_listToMaybe;
-(NSArray *)oh_catMaybes;
-(NSArray *)oh_mapMaybe:(id(^)(id))f;

@end
