#import <Foundation/Foundation.h>
#import "BPRequestModel.h"

@interface BPAddress : BPRequestModel

@property NSString *street;
@property NSString *number;
@property NSString *complement;
@property NSString *zipCode;
@property NSString *city;
@property NSString *state;
@property NSString *country;

@end
