//
//  EggModelView.m
//  EggXample
//
//  Created by Idriss on 04/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import "EggModelView.h"

#import "Egg.h"

@interface EggModelView ()

@property (nonatomic, strong) Egg *egg;

@end

@implementation EggModelView

- (instancetype)initWithEgg:(Egg*)egg
{
    self = [super init];
    if (self) {
        _egg = egg;
    }
    return self;
}

- (NSString*)eggTitle
{
    if (self.egg) {
        return [NSString stringWithFormat:@"%@ [%@]", self.egg.type, self.egg.color];
    } else {
        return nil;
    }
}


@end
