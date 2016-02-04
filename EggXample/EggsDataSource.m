//
//  EggsDataSource.m
//  EggXample
//
//  Created by Idriss on 02/02/2016.
//  Copyright © 2016 iOS Workshop. All rights reserved.
//

#import "EggsDataSource.h"
#import "Egg.h"

@interface EggsDataSource ()

@property (nonatomic, strong) NSArray *eggs;

@end

@implementation EggsDataSource

- (instancetype)initWithFileURL:(NSURL*)fileURL
{
    self = [super init];
    if (self) {
        _eggs = [self parseEggsDataURL:fileURL];
    }
    return self;
}

- (NSArray*)parseEggsDataURL:(NSURL*)dataURL
{
    NSError *error;
    
    NSData *eggsData   = [NSData dataWithContentsOfURL:dataURL];
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
        return [NSArray arrayWithArray:eggs];
    }
    return nil;
}

@end
