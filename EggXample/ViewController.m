//
//  ViewController.m
//  EggXample
//
//  Created by Idriss on 02/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import "ViewController.h"

#import "Egg.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) IBOutlet UIPickerView *eggPicker;

@property (nonatomic, strong) NSArray *eggs;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  [self getEggs];
  
  self.eggPicker.dataSource = self;
  self.eggPicker.delegate   = self;
}

- (void)getEggs
{

  NSError *error;
  
  NSURL *eggsDataURL = [[NSBundle mainBundle] URLForResource:@"Eggs" withExtension:@"json"];
  NSData *eggsData   = [NSData dataWithContentsOfURL:eggsDataURL];
  NSArray *eggsArray = [NSJSONSerialization JSONObjectWithData:eggsData
                                                       options:0
                                                         error:&error];
  
  if (!error) {
    NSMutableArray *eggs = [NSMutableArray array];
    
    for (NSDictionary *eggDictionary in eggsArray) {
      Egg *egg  = [Egg new];
      egg.type  = eggDictionary[@"type"];
      egg.color = eggDictionary[@"color"];
      
      [eggs addObject:egg];
    }
    self.eggs = [NSArray arrayWithArray:eggs];
  }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  return [self.eggs count];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  Egg *egg = self.eggs[row];
  NSString *eggTitle = [NSString stringWithFormat:@"%@ [%@]", egg.type, egg.color];
  return eggTitle;
}

@end
