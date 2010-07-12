#define toPt(a) (*((CGPoint *)(&a)))
#define toSz(a) (*((CGSize  *)(&a)))
#define ptFromScalar(s) CGPointMake(s, s)
#define szFromScalar(s) CGSizeMake(s, s)

typedef struct CGPoint *pCGPoint;
typedef struct CGSize  *pCGSize;
typedef struct CGRect  *pCGRect;

CGPoint ptAdd(    CGPoint  a, CGPoint  b);
CGPoint ptSub(    CGPoint  a, CGPoint  b);
CGPoint ptDiff(   CGPoint  a, CGPoint  b);
CGPoint ptNeg(    CGPoint  a);
void    ptNegInpl(pCGPoint a);

CGPoint ptScale(    float  s, CGPoint  a);
void    ptScaleInpl(float  s, pCGPoint a);
CGPoint ptDiv(    CGPoint  a,   float  s);
void    ptDivInpl(pCGPoint a,   float  s);
CGPoint ptCompMul(CGPoint  a, CGPoint  b);
CGPoint ptCompDiv(CGPoint  a, CGPoint  b);
CGPoint ptInv(    CGPoint  a);
void    ptInvInpl(pCGPoint a);
// TODO float   dotProd( CGPoint   a,  CGPoint b)   // dot    product, scalar product, inner product 
// TODO         vecProd                             // vector product, cross  product, outer product
// TODO         area
// TODO         angle

double  ptNorm(CGPoint a);
CGPoint ptNormalize(     CGPoint a);
void    ptNormalizeInpl(pCGPoint a);

CGSize szAdd(     CGSize  a, CGSize  b);
CGSize szSub(     CGSize  a, CGSize  b);
CGSize szDiff(    CGSize  a, CGSize  b);
CGSize szNeg(     CGSize  a);
void   szNegInpl( pCGSize a);

CGSize szScale(    float  s, CGSize  a);
void   szScaleInpl(float  s, pCGSize a);
CGSize szDiv(     CGSize  a,  float  s);
void   szDivInpl( pCGSize a,  float  s);
CGSize szCompMul( CGSize  a, CGSize  b);
CGSize szCompDiv( CGSize  a, CGSize  b);
CGSize szInv(     CGSize  a);
void   szInvInpl( pCGSize a);

float  szNorm(CGSize a);            // euklidian norm
CGSize szNomalize(     CGSize  a);
void   szNormalizeInpl(pCGSize a);


CGPoint szToPt(CGSize  a);          // there are also c macros which might be faster but unsafe
CGSize  ptToSz(CGPoint a);

float ptDist(CGPoint a, CGPoint b); // euklidian distance
int   ptQuadrant(CGPoint a);        // quadrant
int   ptOctant(  CGPoint a);        // oktant

CGRect rectMv(    CGRect  r, CGPoint p);
void   rectMvInpl(pCGRect r, CGPoint p);

