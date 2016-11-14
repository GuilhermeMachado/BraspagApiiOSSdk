//
//  BPEnvironmentSpec.m
//  Braspag
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//  Copyright © 2016 Thiago Rodrigues de Paula. All rights reserved.
//

#import <Braspag/BPEnvironment.h>

SpecBegin(BPEnvironmentSpec)

describe(@"+sandbox", ^{
    it(@"should contain the correct urls", ^{
        BPEnvironment *sandbox = [BPEnvironment sandbox];

        expect(sandbox.apiUrl).to.equal(@"https://apisandbox.braspag.com.br/");
        expect(sandbox.apiQueryUrl).to.equal(@"https://apiquerysandbox.braspag.com.br/");
    });
});

describe(@"+production", ^{
    it(@"should contain the correct urls", ^{
        BPEnvironment *production = [BPEnvironment production];

        expect(production.apiUrl).to.equal(@"https://api.braspag.com.br/");
        expect(production.apiQueryUrl).to.equal(@"https://apiquery.braspag.com.br/");
    });
});

SpecEnd
