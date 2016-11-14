#import "BPMerchant.h"

@implementation BPMerchant

- (id)initWithId:(NSString *)ID andKey:(NSString *)key {
    self = [super init];
    if (!self) return nil;

    _ID = ID;
    _key = key;

    return self;
}

+ (id)initWithId:(NSString *)ID andKey:(NSString *)key {
    return [[[self class] alloc] initWithId:ID andKey:key];
}

@end
