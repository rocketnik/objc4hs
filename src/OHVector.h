CGPoint  addP(CGPoint a, CGPoint b);
CGPoint  subP(CGPoint a, CGPoint b);
CGPoint diffP(CGPoint a, CGPoint b);
CGPoint  negP(CGPoint a);
CGPoint sMulP(float   s, CGPoint a);
CGPoint compMul(CGPoint a, CGPoint b);
CGPoint compInverseP(CGPoint a);

float   distP(CGPoint a, CGPoint b); // euklidian distance
int quadrantP(CGPoint a);            // quadrant
int   octantP(CGPoint a);            // oktant
CGSize  sMulS(float   s, CGSize  a);
CGRect    mvR(CGRect  r, CGPoint p);
