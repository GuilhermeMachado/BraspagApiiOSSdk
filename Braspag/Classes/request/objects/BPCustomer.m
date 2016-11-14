#import "BPCustomer.h"
#import "BPJSONAdapter.h"

@implementation BPCustomer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"Name",
             @"email": @"Email",
             @"birthDate": @"BirthDate",
             @"identity": @"Identity",
             @"identityType": @"IdentityType",
             @"address": @"Address",
             @"deliveryAddress": @"DeliveryAddress"
             };
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [BPJSONAdapter dictionaryTransformerWithModelClass:BPAddress.class];
}

+ (NSValueTransformer *)deliveryAddressJSONTransformer {
    return [BPJSONAdapter dictionaryTransformerWithModelClass:BPAddress.class];
}

@end
