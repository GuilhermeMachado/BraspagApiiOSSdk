#import "BPCreditCard.h"

@implementation BPCreditCard

- (id)init {
    if (self = [super init]) {
        _saveCard = false;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"cardNumber": @"CardNumber",
             @"holder": @"Holder",
             @"expirationDate": @"ExpirationDate",
             @"securityCode": @"SecurityCode",
             @"saveCard": @"SaveCard",
             @"brand": @"Brand",
             @"cardToken": @"CardToken"
             };
};

@end
