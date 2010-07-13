#include "DataOrd.h"

BOOL(^oh_comparing(NSString *name))(id,id)  {
    return Block_copy(^(id a, id b){ return (BOOL)[[a valueForKey:name] isEqual:[b valueForKey:name]];});
}