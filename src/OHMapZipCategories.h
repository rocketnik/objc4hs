#import "OHNSNullCatfromObj.h"
#import "OHHelper.h"
#import "OHTuple.h"

@interface NSObject (OHMapZipCategories)

-(NSArray *)mapSel: (SEL)sel arr:(NSArray  *)arr;
-(void     )mapSel_:(SEL)sel arr:(NSArray  *)arr;
-(NSArray *)mapSel: (SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr;
-(void     )mapSel_:(SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr;
-(NSArray *)mapSel: (SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj;
-(void     )mapSel_:(SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj;

-(NSArray *)zipWithSel: (SEL)sel arr:(NSArray *)arr1 arr:(NSArray *)arr2;
-(void     )zipWithSel_:(SEL)sel arr:(NSArray *)arr1 arr:(NSArray *)arr2;

@end


@interface NSArray (NMPerfSelCategories)

-(NSArray *)mapSel: (SEL)sel;
-(void     )mapSel_:(SEL)sel;
-(NSArray *)mapSel: (SEL)sel obj:(NSObject *)obj;
-(void     )mapSel_:(SEL)sel obj:(NSObject *)obj;
-(NSArray *)mapSel: (SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2;
-(void     )mapSel_:(SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2;

-(NSArray *)zipWith: (SEL)sel arr:(NSArray  *)arr;
-(void     )zipWith_:(SEL)sel arr:(NSArray  *)arr;
-(NSArray *)zipWith: (SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr;
-(void     )zipWith_:(SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr;
-(NSArray *)zipWith: (SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj;
-(void     )zipWith_:(SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj;

-(NSArray *)zipWith3: (SEL)sel arr:(NSArray *)arr1 arr:(NSArray *)arr2;
-(void     )zipWith3_:(SEL)sel arr:(NSArray *)arr1 arr:(NSArray *)arr2;

-(NSArray *)zip:(NSArray *)arr;

@end

