//
//  ViewController.m
//  HW_1_Sberbank
//
//  Created by Давид on 26/09/2019.
//  Copyright © 2019 David. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //First exercise with numbers
    [self exerciseWithIntArray: [NSMutableArray arrayWithArray:@[@3, @6, @32, @24, @81]]];
    
    //Second exercise with strings
    [self exerciseWithArrayOfString:[NSMutableArray arrayWithArray:@[@"cataclism", @"catepillar", @"cat", @"teapot", @"truncate"]]];
}

#pragma mark - First exercise with numbers(3, 6, 32, 24, 81)

- (void)exerciseWithIntArray:(NSMutableArray*)originalIntArray{
    [self sortFromLowToHigh:originalIntArray];
    NSMutableArray *temporaryArray = [NSMutableArray array];
    for (NSNumber *object in originalIntArray){
        NSComparisonResult result = [@20 compare:object];
        if (result < 0 && object.intValue % 3 == 0) {
            [temporaryArray addObject:object];
        }
    }
    NSLog(@"Chose numbers greater than 20 and multiples of 3: %@", temporaryArray);
    [originalIntArray addObjectsFromArray:temporaryArray];
    NSLog(@"originalArray + temporaryArray: %@", originalIntArray);
    [self sortFromHighToLow:originalIntArray];
}

- (void) sortFromLowToHigh:(NSMutableArray*)sortedArray{
    NSSortDescriptor *sortFromLowToHigh = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    [sortedArray sortUsingDescriptors:[NSArray arrayWithObject:sortFromLowToHigh]];
    NSLog(@"The array was sorted in ascending order: %@", sortedArray);
}

- (void) sortFromHighToLow:(NSMutableArray*)sortedArray{
    NSSortDescriptor *sortFromHighToLow = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    [sortedArray sortUsingDescriptors:[NSArray arrayWithObject:sortFromHighToLow]];
    NSLog(@"The array was sorted in descending order: %@", sortedArray);
}



#pragma mark - Second exercise with strings

- (void)exerciseWithArrayOfString:(NSMutableArray*)originalStringArray{
    NSLog(@"Array before predicate is used: %@", originalStringArray);
    NSMutableArray *filteredArray = [NSMutableArray array];
    for (NSString *object in originalStringArray)
    {
            if([object hasPrefix:@"cat"]){
                [filteredArray addObject:object];
            }
    }
    NSLog(@"Array after predicate is used: %@", filteredArray);
    [self fromArrayToDictionary:filteredArray];
}

- (void)fromArrayToDictionary:(NSMutableArray*)filteredStringArray{
    NSDictionary *fromArray = [NSMutableDictionary dictionary];
    for (NSString* word in filteredStringArray) {
            [fromArray setValue:@(word.length) forKey:word];
    }
    NSLog(@"New dictionary from array: %@", fromArray);
}



@end
