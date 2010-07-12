#import "OHAdditionsFoundation.h"

NSRange NSRangeMake(NSUInteger loc, NSUInteger len) {
    NSRange range;
    range.location = loc;
    range.length   = len;
    return range;
}