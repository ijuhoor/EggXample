//
//  EggsPickerDataSource.h
//  EggXample
//
//  Created by Idriss on 04/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EggsDataSource;

@interface EggsPickerController : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) EggsDataSource *datasource;

@end
