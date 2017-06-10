#import <Foundation/Foundation.h>

#import "BPMerchant.h"
#import "BPEnvironment.h"
#import "BPSale.h"

typedef void (^BPRequestSuccessBlock) (BPSale *sale);
typedef void (^BPRequestFailureBlock) (NSError *error, NSHTTPURLResponse* httpResponse);

@interface BPBraspag : NSObject

@property (readonly) BPMerchant *merchant;
@property (readonly) BPEnvironment *environment;

- (id)initWithMerchant:(BPMerchant *)merchant
        andEnvironment:(BPEnvironment *)environment;

- (void)createSaleWithJSONResponse:(NSDictionary *)dictionary success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure;

- (void)createSale:(BPSale *)sale success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure;

- (void)querySale:(NSString *)paymentId success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure;

- (void)cancelSale:(NSString *)paymentId withAmount:(int)amount success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure;
- (void)cancelSale:(NSString *)paymentId success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure;

- (void)captureSale:(NSString *)paymentId withAmount:(int)amount andServiceTaxAmount:(int)serviceTaxAmount success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure;
- (void)captureSale:(NSString *)paymentId withAmount:(int)amount success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure;
- (void)captureSale:(NSString *)paymentId success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure;
@end
