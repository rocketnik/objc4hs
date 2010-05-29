#import "OHVector.h"

CGPoint addP(CGPoint a, CGPoint b) {
	return CGPointMake(a.x+b.x, a.y+b.y);
}

CGPoint subP(CGPoint a, CGPoint b) {
	return addP(a, negP(b));
}

CGPoint diffP(CGPoint a, CGPoint b) {
	return subP(b,a);
}

CGPoint negP(CGPoint a) {
	return sMulP(-1.f,a);
}

CGPoint sMulP(float s, CGPoint a) {
	return CGPointMake(s*a.x, s*a.y);
}

CGPoint compMul(CGPoint a, CGPoint b) {
	return CGPointMake(a.x*b.x, a.y*b.y);
}

CGPoint compInverseP(CGPoint a) {
	return CGPointMake(1.f/a.x, 1.f/a.y);
}

float distP(CGPoint a, CGPoint b) {
	CGPoint d = diffP(a,b);
	return sqrt(d.x*d.x+d.y*d.y);
}

//   +
// 2 | 1
// --+-- +
// 3 | 4

int quadrantP(CGPoint a) {
	return (a.y>=0.f)? ((a.x<0.f)? 2 : 1 ) :
	((a.x<0.f)? 3 : 4 ) ;
}

//     +
//   \3|2/
//  4 \|/ 1
//  ---•--- +
//  5 /|\ 8
//   /6|7\

int octantP(CGPoint a) {
	float absX = fabs(a.x);
	float absY = fabs(a.y);
	switch (quadrantP(a)) {
		case 1: return (absX>absY)? 1 : 2; break;
		case 2: return (absX<absY)? 3 : 4; break;
		case 3: return (absX>absY)? 5 : 6; break;
		case 4: return (absX<absY)? 7 : 8; break;
	}
	return -1;
}

CGSize smulS(float s, CGSize a) {
	return CGSizeMake(s*a.width,s*a.height);	
}

CGRect mvR(CGRect r, CGPoint p) {
	return CGRectMake(r.origin.x+p.x, r.origin.y+p.y, r.size.width, r.size.height);
}
