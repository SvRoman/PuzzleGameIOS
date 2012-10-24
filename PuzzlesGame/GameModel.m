//
//  GameModel.m
//  PuzzlesGame
//
//  Created by Roman Svarychevskyi on 24.10.2012.
//  Copyright (c) 2012 Roman Svarychevskyi. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

@synthesize puzzlesArray = _puzzlesArray;
@synthesize coordinatesArray = _coordinatesArray;
@synthesize puzzlesCount = _puzzlesCount;

-(id)init {
    self = [super init];
    if (self) {
        [self setArraysData];
        self.puzzlesCount = 0;
    }
    return self;
}

-(void)setArraysData {
    self.puzzlesArray = @[[UIImage imageNamed:@"kot_element_1"],
                        [UIImage imageNamed:@"kot_element_2"],
                        [UIImage imageNamed:@"kot_element_3"],
                        [UIImage imageNamed:@"kot_element_4"]];
    
    self.coordinatesArray = @[[NSValue valueWithCGRect:CGRectMake(285.5f, 107.0f, 50.0f, 50.0f)],
                            [NSValue valueWithCGRect:CGRectMake(211.0f, 180.0f, 50.0f, 50.0f)],
                            [NSValue valueWithCGRect:CGRectMake(78.0f, 75.0f, 50.0f, 50.0f)],
                            [NSValue valueWithCGRect:CGRectMake(84.0f, 212.0f, 50.0f, 50.0f)]];
}

@end
