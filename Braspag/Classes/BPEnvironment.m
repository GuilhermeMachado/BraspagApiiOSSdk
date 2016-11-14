#import "BPEnvironment.h"

@implementation BPEnvironment

- (id)initWithApiUrl:(NSString *)apiUrl andApiQueryUrl:(NSString *)apiQueryUrl {
    self = [super init];
    if (!self) return nil;

    _apiUrl = [NSURL URLWithString:apiUrl];
    _apiQueryUrl = [NSURL URLWithString:apiQueryUrl];

    return self;
}

+ (id)initWithApiUrl:(NSString *)apiUrl andApiQueryUrl:(NSString *)apiQueryUrl {
    return [[[self class] alloc] initWithApiUrl:apiUrl andApiQueryUrl:apiQueryUrl];
}

+ (BPEnvironment *)sandbox {
    static BPEnvironment *sharedSandboxInstance = nil;
    static dispatch_once_t sandboxOnceToken;

    dispatch_once(&sandboxOnceToken, ^{
        sharedSandboxInstance = [BPEnvironment initWithApiUrl:@"https://apisandbox.braspag.com.br/"
                                                andApiQueryUrl:@"https://apiquerysandbox.braspag.com.br/"];
    });

    return sharedSandboxInstance;
}

+ (BPEnvironment *)production {
    static BPEnvironment *sharedProductionInstance = nil;
    static dispatch_once_t productionOnceToken;

    dispatch_once(&productionOnceToken, ^{
        sharedProductionInstance = [BPEnvironment initWithApiUrl:@"https://api.braspag.com.br/"
                                                   andApiQueryUrl:@"https://apiquery.braspag.com.br/"];
    });

    return sharedProductionInstance;
}

@end
