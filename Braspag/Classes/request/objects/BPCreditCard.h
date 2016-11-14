#import <Foundation/Foundation.h>
#import "BPRequestModel.h"

@interface BPCreditCard : BPRequestModel

@property NSString *cardNumber;
@property NSString *holder;
@property NSString *expirationDate;
@property NSString *securityCode;
@property BOOL saveCard;
@property NSString *brand;
@property NSString *cardToken;

@end
