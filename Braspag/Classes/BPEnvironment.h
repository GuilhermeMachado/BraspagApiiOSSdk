#import <Foundation/Foundation.h>

@interface BPEnvironment : NSObject

@property (readonly) NSURL *apiUrl;
@property (readonly) NSURL *apiQueryUrl;

+ (BPEnvironment *)sandbox;
+ (BPEnvironment *)production;

@end
