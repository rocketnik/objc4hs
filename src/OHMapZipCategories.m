#import "OHMapZipCategories.h"

@implementation NSObject (OHMapZipCategories)

#define perf2(o,sel) [o performSelector:sel]
#define perf3(o,sel,obj) [o performSelector:sel withObject:obj]
#define perf4(o,sel,obj1,obj2) [o performSelector:sel withObject:obj1 withObject:obj2]
#define arrCap(cap) NSMutableArray *array = [NSMutableArray arrayWithCapacity:cap]
#define arrAddObj(obj) [array addObject:[NSNull fromObj:obj]]
#define foroIn(arr) for (NSObject *o in arr)
#define fori(cnt) for (int i=0; i<cnt; ++i)

-(NSArray *)mapSel: (SEL)sel arr:(NSArray  *)arr {
	arrCap([arr count]);
	foroIn(arr)
		arrAddObj(perf3(self,sel,o));
	return array;
}

-(void     )mapSel_:(SEL)sel arr:(NSArray  *)arr {
	foroIn(arr)
		perf3(self,sel,o);
}

-(NSArray *)mapSel: (SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr {
	arrCap([arr count]);
	foroIn(arr)
		arrAddObj(perf4(self,sel,obj,o));
	return array;
}

-(void     )mapSel_:(SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr {
	foroIn(arr)
		perf4(self,sel,obj,o);
}

-(NSArray *)mapSel: (SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj {
	arrCap([arr count]);
	foroIn(arr)
		arrAddObj(perf4(self,sel,o,obj));
	return array;
}

-(void     )mapSel_:(SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj {
	foroIn(arr)
		perf4(self,sel,o,obj);
}

-(NSArray *)zipWithSel: (SEL)sel arr:(NSArray *)arr1 arr:(NSArray *)arr2 {
	int cnt = min([arr1 count],[arr2 count]);
	arrCap(cnt);
	fori(cnt)
		arrAddObj(perf4(self,sel,[arr1 objectAtIndex:i],[arr2 objectAtIndex:i]));
	return array;
}

-(void     )zipWithSel_:(SEL)sel arr:(NSArray *)arr1 arr:(NSArray *)arr2 {
	int cnt = min([arr1 count],[arr2 count]);
	fori(cnt)
		perf4(self,sel,[arr1 objectAtIndex:i],[arr2 objectAtIndex:i]);
}

@end

@implementation NSArray (NMPerfSelCategories)


-(NSArray *)mapSel: (SEL)sel {
	arrCap([self count]);
	foroIn(self)
		arrAddObj(perf2(o,sel));
	return array;
}

-(void     )mapSel_:(SEL)sel {
	foroIn(self)
		perf2(o,sel);
}

-(NSArray *)mapSel: (SEL)sel obj:(NSObject *)obj {
	arrCap([self count]);
	foroIn(self)
		arrAddObj(perf3(o,sel,obj));
	return array;
}

-(void     )mapSel_:(SEL)sel obj:(NSObject *)obj {
	foroIn(self)
		perf3(o,sel,obj);
}

-(NSArray *)mapSel: (SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2 {
	arrCap([self count]);
	foroIn(self)
		arrAddObj(perf4(o,sel,obj1,obj2));
	return array;
}

-(void     )mapSel_:(SEL)sel obj:(NSObject *)obj1 obj:(NSObject *)obj2 {
	foroIn(self)
		perf4(o,sel,obj1,obj2);
}

-(NSArray *)zipWith: (SEL)sel arr:(NSArray  *)arr {
	int cnt = min([self count],[arr count]);
	arrCap(cnt);
	fori(cnt)
		arrAddObj(perf3([self objectAtIndex:i],sel,[arr objectAtIndex:i]));
	return array;
}

-(void     )zipWith_:(SEL)sel arr:(NSArray  *)arr {
	int cnt = min([self count],[arr count]);
	fori(cnt)
		perf3([self objectAtIndex:i],sel,[arr objectAtIndex:i]);
}

-(NSArray *)zipWith: (SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr {
	int cnt = min([self count],[arr count]);
	arrCap(cnt);
	fori(cnt)
		arrAddObj(perf4([self objectAtIndex:i],sel,obj,[arr objectAtIndex:i]));
	return array;
}

-(void     )zipWith_:(SEL)sel obj:(NSObject *)obj arr:(NSArray  *)arr {
	int cnt = min([self count],[arr count]);
	fori(cnt)
		perf4([self objectAtIndex:i],sel,obj,[arr objectAtIndex:i]);
}

-(NSArray *)zipWith: (SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj {
	int cnt = min([self count],[arr count]);
	arrCap(cnt);
	fori(cnt)
		arrAddObj(perf4([self objectAtIndex:i],sel,[arr objectAtIndex:i],obj));
	return array;
}

-(void     )zipWith_:(SEL)sel arr:(NSArray  *)arr obj:(NSObject *)obj {
	int cnt = min([self count],[arr count]);
	fori(cnt)
		perf4([self objectAtIndex:i],sel,[arr objectAtIndex:i],obj);
}

-(NSArray *)zipWith3: (SEL)sel arr:(NSArray *)arr1 arr:(NSArray *)arr2 {
	int cnt = min3([self count],[arr1 count],[arr2 count]);
	arrCap(cnt);
	fori(cnt)
		arrAddObj(perf4([self objectAtIndex:i],sel,[arr1 objectAtIndex:i],[arr2 objectAtIndex:i]));
	return array;
}

-(void     )zipWith3_:(SEL)sel arr:(NSArray *)arr1 arr:(NSArray *)arr2 {
	int cnt = min3([self count],[arr1 count],[arr2 count]);
	fori(cnt)
		perf4([self objectAtIndex:i],sel,[arr1 objectAtIndex:i],[arr2 objectAtIndex:i]);
}

-(NSArray *)zip:(NSArray *)arr {
	int cnt = min([self count],[arr count]);
	arrCap(cnt);
	fori(cnt)
		arrAddObj([OHTuple tuple:[self objectAtIndex:i] :[arr objectAtIndex:i]]);
	return array;
}

@end
 

