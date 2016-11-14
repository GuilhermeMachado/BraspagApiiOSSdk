#import <Mantle/Mantle.h>

@protocol BPJSONAdapting <MTLJSONSerializing>

@optional
+ (NSSet<NSString *> *)propertyKeysForJSONRepresentation;
+ (BOOL)withoutNil;

@end

@interface BPJSONAdapter : MTLJSONAdapter

- (NSSet *)serializablePropertyKeys:(NSSet *)propertyKeys
                           forModel:(id<BPJSONAdapting>)model;

@end
