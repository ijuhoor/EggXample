//
//  EggModelView.h
//  EggXample
//
//  Created by Idriss on 04/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Egg;

@interface EggModelView : NSObject

- (instancetype)initWithEgg:(Egg*)egg;
- (NSString*)eggTitle;

@end
