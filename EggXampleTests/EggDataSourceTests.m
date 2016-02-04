//
//  EggDataSourceTests.m
//  EggXample
//
//  Created by Idriss on 04/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Egg.h"
#import "EggsDataSource.h"

@interface EggDataSourceTests : XCTestCase

@end

@implementation EggDataSourceTests

- (void)testNilURL
{
    XCTAssertThrows([[EggsDataSource alloc] initWithFileURL:nil]);
}

- (void)testMalformedEggsData
{
    
    NSURL *dataURL = [[NSBundle bundleForClass:[EggDataSourceTests class]] URLForResource:@"malformedEggsData" withExtension:@"json"];
    
    EggsDataSource *dataSource = [[EggsDataSource alloc] initWithFileURL:dataURL];
    XCTAssertNotNil(dataSource);
    
    XCTAssertNil(dataSource.eggs);
}

- (void)testCorrectEggsData
{
    
    NSURL *dataURL = [[NSBundle bundleForClass:[EggDataSourceTests class]] URLForResource:@"testEggs" withExtension:@"json"];
    
    EggsDataSource *dataSource = [[EggsDataSource alloc] initWithFileURL:dataURL];
    XCTAssertNotNil(dataSource);
    
    XCTAssertNotNil(dataSource.eggs);
    
    XCTAssertEqual(2, [dataSource.eggs count]);
    
    Egg *egg1 = dataSource.eggs[0];
    XCTAssertEqualObjects(@"test egg 1", egg1.type);
    XCTAssertEqualObjects(@"blue", egg1.color);

    Egg *egg2 = dataSource.eggs[1];
    XCTAssertEqualObjects(@"test egg 2", egg2.type);
    XCTAssertEqualObjects(@"white", egg2.color);

}

@end
