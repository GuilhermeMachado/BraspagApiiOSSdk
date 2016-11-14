#import <Foundation/Foundation.h>
#import "BPRequestModel.h"
#import "BPAddress.h"

@interface BPCustomer : BPRequestModel

@property NSString *name;
@property NSString *email;
@property NSString *birthDate;
@property NSString *identity;
@property NSString *identityType;
@property BPAddress *address;
@property BPAddress *deliveryAddress;

@end
