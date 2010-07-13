@interface NSObject (DataMaybeNSObject)

+(id)oh_maybeFallback:(id)fallback function:(id(^)(id))f value:(id)value;
+(id)oh_fromMaybe:(id)fallback value:(id)value;
+(NSArray *)oh_maybeToListNSArray:(id)obj;
+(NSSet *)oh_maybeToListNSSet:(id)obj;
    
@end
