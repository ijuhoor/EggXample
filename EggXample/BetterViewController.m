//
//  BetterViewController.m
//  EggXample
//
//  Created by Idriss on 02/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import "BetterViewController.h"

#import "EggsDataSource.h"
#import "EggsPickerController.h"

@interface BetterViewController ()

@property (nonatomic, strong) IBOutlet UIPickerView *eggPicker;

@property (nonatomic, strong) EggsPickerController *pickerController;
@property (nonatomic, strong) EggsDataSource       *datasource;

@end

@implementation BetterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *eggsDataURL = [[NSBundle mainBundle] URLForResource:@"Eggs" withExtension:@"json"];
    
    self.datasource = [[EggsDataSource alloc] initWithFileURL:eggsDataURL];

    self.pickerController            = [[EggsPickerController alloc] init];
    self.pickerController.datasource = self.datasource;
    
    self.eggPicker.dataSource = self.pickerController;
    self.eggPicker.delegate   = self.pickerController;

}

@end
