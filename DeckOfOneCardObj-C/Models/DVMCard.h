//
//  DVMCard.h
//  DeckOfOneCardObj-C
//
//  Created by Devin Singh on 1/28/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy) NSString *suit;
@property (nonatomic, copy) NSString *imageString;

- (instancetype) initWithSuit:(NSString *)suit imageString:(NSString *)imageString;
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id>*)dictionary;

@end

NS_ASSUME_NONNULL_END
