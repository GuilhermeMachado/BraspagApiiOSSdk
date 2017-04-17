#import "BPPayment.h"

@implementation BPPayment

- (id)init {
    if (self = [super init]) {
        _capture = NO;
        _authenticate = NO;
        _softDescriptor = @"";
        _currency = BRL;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"serviceTaxAmount": @"ServiceTaxAmount",
             @"installments": @"Installments",
             @"interest": @"Interest",
             @"capture": @"Capture",
             @"authenticate": @"Authenticate",
             @"recurrent": @"Recurrent",
             @"creditCard": @"CreditCard",
             @"proofOfSale": @"ProofOfSale",
             @"authorizationCode": @"AuthorizationCode",
             @"softDescriptor": @"SoftDescriptor",
             @"returnUrl": @"ReturnUrl",
             @"provider": @"Provider",
             @"paymentId": @"PaymentId",
             @"type": @"Type",
             @"amount": @"Amount",
             @"receivedDate": @"ReceiveDate",
             @"capturedAmount": @"CapturedAmount",
             @"capturedDate": @"CapturedDate",
             @"currency": @"Currency",
             @"country": @"Country",
             @"reasonCode": @"ReasonCode",
             @"reasonMessage": @"ReasonMessage",
             @"providerReturnCode": @"ProviderReturnCode",
             @"providerReturnMessage": @"ProviderReturnMessage",
             @"status": @"Status",
             @"links": @"Links",
             @"extraDataCollection": @"ExtraDataCollection",
             @"expirationDate": @"ExpirationDate",
             @"url": @"Url",
             @"number": @"Number",
             @"barCodeNumber": @"BarCodeNumber",
             @"digitableLine": @"DigitableLine",
             @"address": @"Address"
             };
}

+ (NSValueTransformer *)creditCardJSONTransformer {
    return [BPJSONAdapter dictionaryTransformerWithModelClass:BPCreditCard.class];
}

+ (NSValueTransformer *)interestJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:NSNumber.class]) return nil;

        return value;
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return value;
    }];
}

+ (NSValueTransformer *)providerJSONTransformer {
    NSDictionary *providerDict = @{
                                   @"Bradesco": @(Bradesco),
                                   @"BancoDoBrasil": @(BancoDoBrasil),
                                   @"Simulado": @(Simulado)
                                   };

    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:providerDict];
}

+ (NSValueTransformer *)typeJSONTransformer {
    NSDictionary *typeDict = @{
                                   @"CreditCard": @(CreditCard),
                                   @"DebitCard": @(DebitCard),
                                   @"ElectronicTransfer": @(ElectronicTransfer),
                                   @"Boleto": @(Boleto)
                                   };

    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:typeDict];
}


/**
 Converte uma String para enum (BPPaymentType).
 
 @param value String relacionada ao enum
 @return String convertida em enum
 */
+ (BPPaymentType)convertStringToBPPaymentType:(NSString *)value {
    
    if ([value isEqualToString:@"CreditCard"]) {
        return CreditCard;
    } else if ([value isEqualToString:@"DebitCard"]) {
        return DebitCard;
    } else if ([value isEqualToString:@"ElectronicTransfer"]) {
        return ElectronicTransfer;
    } else {
        return Boleto;
    }
    
}

/**
 Converte uma String para enum (BPPaymentProvider).
 
 @param value String relacionada ao enum
 @return String convertida em enum
 */
+ (BPPaymentProvider)convertStringToBPPaymentProvider:(NSString *)value {
    
    if ([value isEqualToString:@"Bradesco"]) {
        return Bradesco;
    } else if ([value isEqualToString:@"BancoDoBrasil"]) {
        return BancoDoBrasil;
    } else {
        return Simulado;
    }
    
}

+ (NSValueTransformer *)currencyJSONTransformer {
    NSDictionary *currencyDict = @{
                                   @"BRL": @(BRL),
                                   @"USD": @(USD),
                                   @"MXN": @(MXN),
                                   @"COP": @(COP),
                                   @"CLP": @(CLP),
                                   @"ARS": @(ARS),
                                   @"PEN": @(PEN),
                                   @"EUR": @(EUR),
                                   @"PYN": @(PYN),
                                   @"UYU": @(UYU),
                                   @"VEB": @(VEB),
                                   @"VEF": @(VEF),
                                   @"GBP": @(GBP)
                                   };

    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:currencyDict];
}

@end
