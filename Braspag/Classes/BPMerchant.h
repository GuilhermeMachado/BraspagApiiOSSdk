#import <Foundation/Foundation.h>

@interface BPMerchant : NSObject

@property (readonly) NSString *ID;
@property (readonly) NSString *key;

+(id) initWithId:(NSString *)ID andKey:(NSString *)key;

@end
