//
//  DVMCard.m
//  DeckOfOneCardObj-C
//
//  Created by Devin Singh on 1/28/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import "DVMCard.h"

@implementation DVMCard

- (instancetype)initWithSuit:(NSString *)suit imageString:(NSString *)imageString
{
    self = [super init];
    
    if (self)
    {
        _suit = suit;
        _imageString = imageString;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary[@"suit"];
    NSString *image = dictionary[@"image"];
    
    return [self initWithSuit:suit imageString:image];
}

@end
