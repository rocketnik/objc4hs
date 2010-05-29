#import "OHFunctionCatImageGetter.h"

@implementation OHFunction (OHFunctionCatImageGetter)

+(OHFunction *)withImgName:(NSString *)name {
	return [OHFunction withObj:[UIImage class] sel:@selector(imageNamed:) par:name];
}

@end
