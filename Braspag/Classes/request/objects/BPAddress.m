#import "BPAddress.h"

@implementation BPAddress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"street": @"Street",
             @"number": @"Number",
             @"complement": @"Complement",
             @"zipCode": @"ZipCode",
             @"city": @"City",
             @"state": @"State",
             @"country": @"Country"
             };
}

@end
