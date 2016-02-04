//
//  EggModelViewTests.m
//  EggXample
//
//  Created by Idriss on 04/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "Egg.h"
#import "EggModelView.h"

@interface EggModelViewTests : XCTestCase

@end

@implementation EggModelViewTests

- (Egg*)testEgg
{
    Egg *e  = OCMClassMock([Egg class]);
    OCMStub([e color]).andReturn(@"White");
    OCMStub([e type]).andReturn(@"Test Egg");
    return e;
}

- (void)testNilEgg
{
    EggModelView *eggModelView = [[EggModelView alloc] initWithEgg:nil];
    XCTAssertNotNil(eggModelView);
    
    NSString *title = [eggModelView eggTitle];
    XCTAssertNil(title);
}

- (void)testNormalEgg
{
    EggModelView *eggModelView = [[EggModelView alloc] initWithEgg:[self testEgg]];
    XCTAssertNotNil(eggModelView);
    
    NSString *title = [eggModelView eggTitle];
    XCTAssertEqualObjects(@"Test Egg [White]", title);
}

@end
