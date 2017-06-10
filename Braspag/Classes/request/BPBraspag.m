#import <AFNetworking/AFNetworking.h>
#import "BPJSONAdapter.h"
#import "BPBraspag.h"
#import "BPSale.h"

@implementation BPBraspag

- (id)initWithMerchant:(BPMerchant *)merchant
        andEnvironment:(BPEnvironment *)environment {
    self = [super init];
    if (!self) return nil;

    _merchant = merchant;
    _environment = environment;

    return self;
}

- (void)createSaleWithJSONResponse:(BPSale *)sale success:(BPRequestJSONSuccessBlock)success failure:(BPRequestFailureBlock)failure; {
    NSDictionary *saleParams = [BPJSONAdapter JSONDictionaryFromModel:sale error:nil];
    [[self apiManager] POST:@"/v2/sales"
                 parameters:saleParams
                   progress:nil
                    success:[self successJSONBlock:success]
                    failure:[self failureBlock:failure]];
}

- (void)createSale:(BPSale *)sale success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure; {
    NSDictionary *saleParams = [BPJSONAdapter JSONDictionaryFromModel:sale error:nil];
    [[self apiManager] POST:@"/v2/sales"
                  parameters:saleParams
                   progress:nil
                    success:[self successBlock:success]
                    failure:[self failureBlock:failure]];
}

- (void)querySale:(NSString *)paymentId success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure; {
    [[self apiQueryManager] GET:[NSString stringWithFormat:@"/v2/sales/%@", paymentId]
                     parameters:nil
                       progress:nil
                        success:[self successBlock:success]
                        failure:[self failureBlock:failure]];
}

- (void)cancelSale:(NSString *)paymentId withAmount:(int)amount success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/v2/sales/%@/void?amount=%i", paymentId, amount]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

- (void)cancelSale:(NSString *)paymentId success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure; {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/v2/sales/%@/void", paymentId]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

- (void)captureSale:(NSString *)paymentId
          withAmount:(int)amount
andServiceTaxAmount:(int)serviceTaxAmount
            success:(BPRequestSuccessBlock)success
            failure:(BPRequestFailureBlock)failure {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/v2/sales/%@/capture?amount=%i&serviceTaxAmount=%i", paymentId, amount, serviceTaxAmount]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

- (void)captureSale:(NSString *)paymentId
         withAmount:(int)amount
            success:(BPRequestSuccessBlock)success
            failure:(BPRequestFailureBlock)failure {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/v2/sales/%@/capture?amount=%i", paymentId, amount]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

- (void)captureSale:(NSString *)paymentId success:(BPRequestSuccessBlock)success failure:(BPRequestFailureBlock)failure {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/v2/sales/%@/capture", paymentId]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

# pragma mark - Private methods

- (void(^)(NSURLSessionDataTask*, id))successBlock:(BPRequestSuccessBlock)success {
    return ^(NSURLSessionDataTask *task, id responseObject) {
        BPSale *sale = [BPJSONAdapter modelOfClass:BPSale.class fromJSONDictionary:responseObject error:nil];
        success(sale);
    };
}

- (void(^)(NSURLSessionDataTask*, id))successJSONBlock:(BPRequestJSONSuccessBlock)success {
    return ^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    };
}

- (void(^)(NSURLSessionDataTask*, NSError*))failureBlock:(BPRequestFailureBlock)failure {
    return ^(NSURLSessionDataTask *task, NSError *error) {
        failure(task.response, error);
    };
}

- (AFHTTPSessionManager *)apiManager {
    return [self httpManager:self.environment.apiUrl];
}

- (AFHTTPSessionManager *)apiQueryManager {
    return [self httpManager:self.environment.apiQueryUrl];
}

- (AFHTTPSessionManager *)httpManager:(NSString *)baseUrl {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]
                                     initWithBaseURL:baseUrl];

    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [self addHeadersTo:manager];

    return manager;
}

- (void)addHeadersTo:(AFHTTPSessionManager *)manager {
    [[self requestHeaders] enumerateKeysAndObjectsUsingBlock:^(NSString* key, NSString* value, BOOL *stop) {
        [manager.requestSerializer setValue:value forHTTPHeaderField:key];
    }];

}

- (NSDictionary *)requestHeaders {
    return @{
             @"Accept": @"application/json",
             @"Accept-Encoding": @"gzip",
             @"Content-Type": @"application/json",
             @"User-Agent": @"Braspag/3.0 iOS SDK",
             @"MerchantId": self.merchant.ID,
             @"MerchantKey": self.merchant.key,
             @"RequestId": [[NSUUID UUID] UUIDString]
             };
}

@end
