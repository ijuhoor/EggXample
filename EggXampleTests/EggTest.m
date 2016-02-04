//
//  EggTest.m
//  EggXample
//
//  Created by Idriss on 04/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Egg.h"

@interface EggTest : XCTestCase

@end

@implementation EggTest

- (void)testEggConstructor
{
    Egg *e = [Egg new];
    XCTAssertNotNil(e);
    
    XCTAssertNil([e color]);
    XCTAssertNil([e type]);
}

@end
