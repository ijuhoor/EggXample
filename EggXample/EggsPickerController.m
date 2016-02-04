//
//  EggsPickerDataSource.m
//  EggXample
//
//  Created by Idriss on 04/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import "EggsPickerController.h"

#import "Egg.h"
#import "EggModelView.h"
#import "EggsDataSource.h"

@implementation EggsPickerController

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *eggs = self.datasource.eggs;
    return [eggs count];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    Egg *egg                   = self.datasource.eggs[row];
    EggModelView *eggModelView = [[EggModelView alloc] initWithEgg:egg];
    return [eggModelView eggTitle];
}

@end
