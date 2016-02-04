//
//  EggsDataSource.h
//  EggXample
//
//  Created by Idriss on 02/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EggsDataSource : NSObject

@property (nonatomic, readonly) NSArray *eggs;

- (instancetype)initWithFileURL:(NSURL*)fileURL;


@end
