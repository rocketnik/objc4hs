#define MIN3(a,b,c) MIN(MIN((a),(b)),(c))
#define MAX3(a,b,c) MAX(MAX((a),(b)),(c))

#define fitRangeClosed(a,l,r)  (((a)<(l))? (l) : (((a)>(r))? (r) : (a) ))
#define fitRangeROpened(a,l,r) (((a)<(l))? (l) : (((a)>=(r))? ((r)-1) : (a) ))

#define Log(x) NSLog(@"%@",x)
#define Use(x) NSLog(@"You should use: %@ %@",[x class],x)
