//
//  BetterViewControllerTests.m
//  EggXample
//
//  Created by Idriss on 04/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BetterViewController.h"

#import "EggsPickerController.h"
#import "EggsDataSource.h"

@interface BetterViewController (_testing)

@property (nonatomic, strong) EggsPickerController *pickerController;
@property (nonatomic, strong) EggsDataSource       *datasource;

@end

@interface BetterViewControllerTests : XCTestCase

@end

@implementation BetterViewControllerTests

- (void)testViewDidLoad
{
    BetterViewController *viewController = [[BetterViewController alloc] init];
    XCTAssertNotNil(viewController);
    
    [viewController viewDidLoad];
    
    XCTAssertNotNil(viewController.pickerController);
    XCTAssertNotNil(viewController.datasource);
}

@end
