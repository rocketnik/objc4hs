#import "OHVector.h"

CGPoint ptAdd(    CGPoint  a, CGPoint  b)  { return CGPointMake(    a.x+b.x,     a.y+b.y); }
CGPoint ptSub(    CGPoint  a, CGPoint  b)  { return CGPointMake(    a.x-b.x,     a.y-b.y); }
CGPoint ptDiff(   CGPoint  a, CGPoint  b)  { return CGPointMake(   -a.x+b.x,    -a.y+b.y); }
CGPoint ptNeg(    CGPoint  a)              { return CGPointMake(   -a.x    ,    -a.y    ); }
void    ptNegInpl(pCGPoint a)              { a->x = -a->x; a->y = -a->y; }

CGPoint ptScale(    float  s, CGPoint  a)  { return CGPointMake(  s*a.x    ,   s*a.y    ); }
void    ptScaleInpl(float  s, pCGPoint a)  { a->x *= s; a->y *= s; }
CGPoint ptDiv(    CGPoint  a,   float  s)  { return CGPointMake(    a.x/s  ,     a.y/s  ); }
void    ptDivInpl(pCGPoint a,   float  s)  { a->x /= s; a->y /= s; }
CGPoint ptCompMul(CGPoint  a, CGPoint  b)  { return CGPointMake(    a.x*b.x,     a.y*b.y); }
CGPoint ptCompDiv(CGPoint  a, CGPoint  b)  { return CGPointMake(    a.x/b.x,     a.y/b.y); }
CGPoint ptInv(    CGPoint  a)              { return CGPointMake(1.f/a.x    , 1.f/a.y    ); }
void    ptInvInpl(pCGPoint a)              { a->x = 1.f/a->x; a->y = 1.f/a->y; }

double  ptNorm(CGPoint a)                  { return sqrt(a.x*a.x + a.y*a.y); }
CGPoint ptNormalize(    CGPoint  a)        { float n = sqrt(a.x*a.x + a.y*a.y); return CGPointMake(a.x/n, a.y/n); }
void    ptNormalizeInpl(pCGPoint a)        { float n = sqrt(a->x*a->x + a->y*a->y); a->x /= n; a->y /= n; }


CGSize szAdd(     CGSize  a, CGSize  b)    { return CGSizeMake(    a.width+b.width,     a.height+b.height); }
CGSize szSub(     CGSize  a, CGSize  b)    { return CGSizeMake(    a.width-b.width,     a.height-b.height); }
CGSize szDiff(    CGSize  a, CGSize  b)    { return CGSizeMake(   -a.width+b.width,    -a.height+b.height); }
CGSize szNeg(     CGSize  a)               { return CGSizeMake(   -a.width        ,    -a.height         ); }
void   szNegInpl( pCGSize a)               { a->width = -a->width; a->height = -a->height; }

CGSize szScale(    float  s, CGSize  a)    { return CGSizeMake(  s*a.width        ,   s*a.height         ); }
void   szScaleInpl(float  s, pCGSize a)    { a->width *= s; a->height *= s; }
CGSize szDiv(     CGSize  a,  float  s)    { return CGSizeMake(    a.width/s      ,     a.height/s       ); }
void   szDivInpl( pCGSize a,  float  s)    { a->width /= s; a->height /=s; }
CGSize szCompMul( CGSize  a, CGSize  b)    { return CGSizeMake(    a.width*b.width,     a.height*b.height); }
CGSize szCompDiv( CGSize  a, CGSize  b)    { return CGSizeMake(    a.width/b.width,     a.height/b.height); }
CGSize szInv(     CGSize  a)               { return CGSizeMake(1.f/a.width        , 1.f/a.height         ); }
void   szInvInpl( pCGSize a)               { a->width = 1.f/a->width; a->height = 1.f/a->height; }      

float  szNorm(CGSize a)                    { return sqrt(a.width*a.width + a.height*a.height); }
CGSize szNomalize(     CGSize  a)          { float n = sqrt(a.width*a.width + a.height*a.height); return CGSizeMake(a.width/n, a.height/n); }
void   szNormalizeInpl(pCGSize a)          { float n = sqrt(a->width*a->width + a->height*a->height); a->width /= n; a->height /= n; }


float ptDist(CGPoint a, CGPoint b) {
    CGPoint d = CGPointMake(-a.x+b.x,-a.y+b.y);
    return sqrt(d.x*d.x+d.y*d.y);
}

//   +
// 2 | 1
// --+-- +
// 3 | 4

int ptQuadrant(CGPoint a) {
    return (a.y>=0.f)? ((a.x<0.f)? 2 : 1 ) :
    ((a.x<0.f)? 3 : 4 ) ;
}

//     +
//   \3|2/
//  4 \|/ 1
//  ---•--- +
//  5 /|\ 8
//   /6|7\

int ptOctant(CGPoint a) {
    float absX = fabs(a.x);
    float absY = fabs(a.y);
    switch (ptQuadrant(a)) {
        case 1: return (absX>absY)? 1 : 2; break;
        case 2: return (absX<absY)? 3 : 4; break;
        case 3: return (absX>absY)? 5 : 6; break;
        case 4: return (absX<absY)? 7 : 8; break;
    }
    return -1;
}

CGRect rectMv(CGRect r, CGPoint p) {
    return CGRectMake(r.origin.x+p.x, r.origin.y+p.y, r.size.width, r.size.height);
}

void   rectMvInpl(pCGRect r, CGPoint p) {
    r->origin.x+=p.x;
    r->origin.y+=p.y;
}
