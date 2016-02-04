//
//  EggsPickerControllerTests.m
//  EggXample
//
//  Created by Idriss on 04/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "EggsDataSource.h"
#import "Egg.h"
#import "EggsPickerController.h"

@interface EggsPickerControllerTests : XCTestCase

@end

@implementation EggsPickerControllerTests

- (UIPickerView*)fakePickerView
{
    UIPickerView *picker = OCMClassMock([UIPickerView class]);
    return picker;
}

- (Egg*)testEgg
{
    Egg *e  = OCMClassMock([Egg class]);
    OCMStub([e color]).andReturn(@"White");
    OCMStub([e type]).andReturn(@"Test Egg");
    return e;
}

- (EggsDataSource*)fakeEggDataSourceWithEggs:(NSArray*)eggs
{
    
    EggsDataSource *fakeDataSource = OCMClassMock([EggsDataSource class]);
    OCMStub([fakeDataSource eggs]).andReturn(eggs);
    
    return fakeDataSource;
}

- (void)testNumberOfComponents
{
    EggsPickerController *pickerController = [[EggsPickerController alloc] init];
    XCTAssertNotNil(pickerController);
    EggsDataSource *datasource  = [self fakeEggDataSourceWithEggs:@[]];
    pickerController.datasource = datasource;
    
    
    
    XCTAssertEqual(1, [pickerController numberOfComponentsInPickerView:[self fakePickerView]]);
}

- (void)testNumberOfRowsWith0Eggs
{
    EggsPickerController *pickerController = [[EggsPickerController alloc] init];
    XCTAssertNotNil(pickerController);
    EggsDataSource *datasource  = [self fakeEggDataSourceWithEggs:@[]];
    pickerController.datasource = datasource;
    
    
    
    XCTAssertEqual(0, [pickerController pickerView:[self fakePickerView] numberOfRowsInComponent:0]);
}

- (void)testNumberOfRowsWith2Eggs
{
    EggsPickerController *pickerController = [[EggsPickerController alloc] init];
    XCTAssertNotNil(pickerController);
    
    NSArray *eggsArray = @[[self testEgg], [self testEgg]];
    
    EggsDataSource *datasource  = [self fakeEggDataSourceWithEggs:eggsArray];
    pickerController.datasource = datasource;
    
    
    
    XCTAssertEqual(2, [pickerController pickerView:[self fakePickerView] numberOfRowsInComponent:0]);
}

- (void)testTitleForRow
{
    EggsPickerController *pickerController = [[EggsPickerController alloc] init];
    XCTAssertNotNil(pickerController);
    
    NSArray *eggsArray = @[[self testEgg], [self testEgg]];
    
    EggsDataSource *datasource  = [self fakeEggDataSourceWithEggs:eggsArray];
    pickerController.datasource = datasource;
    
    
    NSString *title = [pickerController pickerView:[self fakePickerView]
                                       titleForRow:0
                                      forComponent:0];
    XCTAssertEqualObjects(@"Test Egg [White]", title);
}

@end
