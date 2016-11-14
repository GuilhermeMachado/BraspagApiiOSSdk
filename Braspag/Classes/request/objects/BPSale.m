#import "BPSale.h"
#import "BPJSONAdapter.h"

@implementation BPSale

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"merchantOrderId": @"MerchantOrderId",
             @"customer": @"Customer",
             @"payment": @"Payment"
             };
}

+ (NSValueTransformer *)customerJSONTransformer {
    return [BPJSONAdapter dictionaryTransformerWithModelClass:BPCustomer.class];
}

+ (NSValueTransformer *)paymentJSONTransformer {
    return [BPJSONAdapter dictionaryTransformerWithModelClass:BPPayment.class];
}

@end
