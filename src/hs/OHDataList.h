//Haskell Data.List

@interface NSObject (OHDataList)

-(NSArray *)oh_mapSel: (SEL)sel arr:(NSArray  *)arr;
-(void     )oh_mapSel_:(SEL)sel arr:(NSArray  *)arr;
-(NSArray *)oh_mapSel: (SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr;
-(void     )oh_mapSel_:(SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr;
-(NSArray *)oh_mapSel: (SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj;
-(void     )oh_mapSel_:(SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj;

@end


@interface NSString (OHDataList)

@end


@interface NSArray (OHDataList)

-(NSArray *)oh_mapSel: (SEL)sel;
-(void     )oh_mapSel_:(SEL)sel;
-(NSArray *)oh_mapSel: (SEL)sel obj:(NSObject *)obj;
-(void     )oh_mapSel_:(SEL)sel obj:(NSObject *)obj;
-(NSArray *)oh_mapSel: (SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2;
-(void     )oh_mapSel_:(SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2;

@end

