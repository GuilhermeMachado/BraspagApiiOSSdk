#import <Foundation/Foundation.h>
#import "BPRequestModel.h"
#import "BPRecurrentPayment.h"
#import "BPCreditCard.h"

typedef enum {
    Bradesco,
    BancoDoBrasil,
    Simulado
} BPPaymentProvider;

typedef enum {
    CreditCard,
    DebitCard,
    ElectronicTransfer,
    Boleto
} BPPaymentType;

typedef enum {
    BRL,
    USD,
    MXN,
    COP,
    CLP,
    ARS,
    PEN,
    EUR,
    PYN,
    UYU,
    VEB,
    VEF,
    GBP
} BPPaymentCurrency;

@interface BPPayment : BPRequestModel

@property NSNumber *serviceTaxAmount;
@property NSNumber *installments;
@property NSString *interest;
@property BOOL capture;
@property BOOL authenticate;
@property BOOL recurrent;
@property BPRecurrentPayment *recurrentPayment;
@property BPCreditCard *creditCard;
@property NSString *proofOfSale;
@property NSString *authorizationCode;
@property NSString *softDescriptor;
@property NSString *returnUrl;
@property BPPaymentProvider provider;
@property NSString *paymentId;
@property BPPaymentType type;
@property NSNumber *amount;
@property NSString *receivedDate;
@property NSNumber *capturedAmount;
@property NSString *capturedDate;
@property BPPaymentCurrency currency;
@property NSString *country;
@property NSString *reasonCode;
@property NSString *reasonMessage;
@property NSString *providerReturnCode;
@property NSString *providerReturnMessage;
@property NSNumber *status;
@property NSArray *links;
@property NSArray *extraDataCollection;
@property NSString *expirationDate;
@property NSString *url;
@property NSString *number;
@property NSString *barCodeNumber;
@property NSString *digitableLine;
@property NSString *address;

@end
