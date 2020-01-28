//
//  DVMCardController.m
//  DeckOfOneCardObj-C
//
//  Created by Devin Singh on 1/28/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import "DVMCardController.h"
#import "DVMCard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const drawComp = @"draw/";
static NSString * const queryName = @"count";
static NSString * const cardsComp = @"cards";

@implementation DVMCardController

+ (void)draw:(NSNumber *)numberOfCards completion:(void (^)(NSArray<DVMCard *> *_Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * drawURL = [baseURL URLByAppendingPathComponent:drawComp];
    
    NSString *cardCount = [numberOfCards stringValue];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:queryName value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    NSURL *searchURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error: no data");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options: 2 error: &error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Unable to create a dictionary from the data");
            completion(nil);
            return;
        }
        
        NSArray * cards = jsonDictionary[cardsComp];
        NSMutableArray *cardsAdd = [NSMutableArray array];
        
        for (NSDictionary *dictionary in cards)
        {
            DVMCard *card = [[DVMCard alloc] initWithDictionary: dictionary];
            [cardsAdd addObject: card];
        }
        
        completion(cardsAdd);
    }]resume];
}

//MARK: - Fetch Image Function

+ (void)fetchCardImage:(DVMCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.imageString];

    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error: no data returned from task");
            completion(nil);
            return;
        }
    
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);

    }]resume];
}

@end


