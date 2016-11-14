//
//  BPViewController.m
//  Braspag
//
//  Created by Thiago Rodrigues de Paula on 09/14/2016.
//  Copyright (c) 2016 Thiago Rodrigues de Paula. All rights reserved.
//

#import "BPViewController.h"
#import <Braspag/BPMerchant.h>
#import <Braspag/BPSale.h>
#import <Braspag/BPAddress.h>
#import <Braspag/BPCustomer.h>
#import <Braspag/BPCreditCard.h>
#import <Braspag/BPPayment.h>
#import <Braspag/BPBraspag.h>

@interface BPViewController ()

@property BPBraspag *saleRequest;

@end

@implementation BPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    BPMerchant *merchant = [BPMerchant initWithId:@"3e0265a9-29df-4196-b01e-a03cd6a7e8ad" andKey:@"UYZCUHFOBDSWMYCZJUFPTDISFHAZRQTFYMKVCAYM"];

    self.saleRequest = [[BPBraspag alloc] initWithMerchant:merchant andEnvironment:[BPEnvironment sandbox]];

    BPAddress *address = [[BPAddress alloc] init];
    address.street = @"Rua Paulo Orozimbo";
    address.number = @"715";
    address.complement = @"Ap 108";
    address.zipCode = @"01535001";
    address.city = @"São Paulo";
    address.state = @"SP";
    address.country = @"Brazil";

    BPCustomer *customer = [[BPCustomer alloc] init];
    customer.name = @"Comprador Teste";
    customer.address = address;
    customer.deliveryAddress = address;

    BPCreditCard *creditCard = [[BPCreditCard alloc] init];
    creditCard.cardNumber = @"0000000000000001";
    creditCard.holder = @"Teste Holder";
    creditCard.expirationDate = @"12/2021";
    creditCard.securityCode = @"123";
    creditCard.brand = @"Visa";

    BPPayment *payment = [[BPPayment alloc] init];
    payment.amount = @15700;
    payment.type = CreditCard;
    payment.provider = Simulado;
    payment.installments = @1;
    payment.creditCard = creditCard;
    //payment.capture = YES;

    BPSale *sale = [[BPSale alloc] init];
    sale.merchantOrderId = @"2014111703";
    sale.customer = customer;
    sale.payment = payment;

    __weak BPViewController *weakSelf = self;

    [self.saleRequest createSale:sale success:^(BPSale *sale) {
        [weakSelf printSale:sale];
        [weakSelf captureSale:sale.payment.paymentId withAmount:15700 andServiceTaxAmount:100];
    } failure:^(NSError *error, NSHTTPURLResponse *httpResponse) {
        NSLog(@"%@", error);
    }];
}

- (void)captureSale:(NSString *)paymentId withAmount:(int)amount andServiceTaxAmount:(int)serviceTaxAmount {
    __weak BPViewController *weakSelf = self;

    [self.saleRequest captureSale:paymentId success:^(BPSale *sale) {
        [weakSelf findSale:paymentId];
    } failure:^(NSError *error, NSHTTPURLResponse *httpResponse) {
        NSLog(@"%@", error);
    }];
}

- (void)cancelSale:(NSString *)paymentId withAmount:(int)amount {
    __weak BPViewController *weakSelf = self;

    [self.saleRequest cancelSale:paymentId withAmount:amount success:^(BPSale *sale) {
        [weakSelf findSale:paymentId];
    } failure:^(NSError *error, NSHTTPURLResponse *httpResponse) {
        NSLog(@"%@", error);
    }];
}

- (void)findSale:(NSString *)paymentId {
    __weak BPViewController *weakSelf = self;

    [self.saleRequest querySale:paymentId success:^(BPSale *sale) {
        [weakSelf printSale:sale];
    } failure:^(NSError *error, NSHTTPURLResponse *httpResponse) {
        NSLog(@"%@", error);
    }];
}

- (void)printSale:(BPSale *)sale {
    NSLog(@"\n\n\n\n\n\n\n\n\n\n%@\n\n\n\n\n\n\n\n\n\n", sale);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
