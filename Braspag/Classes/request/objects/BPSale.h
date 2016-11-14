#import <Foundation/Foundation.h>
#import "BPRequestModel.h"
#import "BPCustomer.h"
#import "BPPayment.h"

@interface BPSale : BPRequestModel

@property NSString *merchantOrderId;
@property BPCustomer *customer;
@property BPPayment *payment;

@end
