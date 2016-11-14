#import <Foundation/Foundation.h>

typedef enum {
    Monthly,
    Bimonthly,
    Quarterly,
    SemiAnnual,
    Annual
} BPRecurrentPaymentInterval;

@interface BPRecurrentPayment : NSObject

@property BOOL authorizeNow;
@property NSString *endDate;
@property BPRecurrentPaymentInterval interval;

@end
