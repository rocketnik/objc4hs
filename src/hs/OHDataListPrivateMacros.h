#define perf2(o,sel) [o performSelector:sel]
#define perf3(o,sel,obj) [o performSelector:sel withObject:obj]
#define perf4(o,sel,obj1,obj2) [o performSelector:sel withObject:obj1 withObject:obj2]
#define arrCap(cap) NSMutableArray *array = [NSMutableArray arrayWithCapacity:cap]
#define arrAddObj(obj) [array addObject:[NSNull fromObj:obj]]
#define foroIn(arr) for (NSObject *o in arr)
#define fori(cnt) for (int i=0; i<cnt; ++i)
