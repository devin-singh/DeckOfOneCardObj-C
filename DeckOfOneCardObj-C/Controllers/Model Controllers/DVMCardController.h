//
//  DVMCardController.h
//  DeckOfOneCardObj-C
//
//  Created by Devin Singh on 1/28/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class DVMCard;

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardController : NSObject

+ (void)draw:(NSNumber *)numberOfCards completion:(void(^) (NSArray<DVMCard *> *_Nullable cards))completion;

+ (void)fetchCardImage:(DVMCard *)card completion:(void(^) (UIImage *_Nullable image))completion;


@end

NS_ASSUME_NONNULL_END
