//
//  GameModel.h
//  PuzzlesGame
//
//  Created by Roman Svarychevskyi on 24.10.2012.
//  Copyright (c) 2012 Roman Svarychevskyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject {
    @private
    NSArray *_puzzlesArray;
    NSArray *_coordinatesArray;
    NSInteger _puzzlesCount;
}

@property (strong, nonatomic) NSArray *puzzlesArray;
@property (strong, nonatomic) NSArray *coordinatesArray;
@property (nonatomic) NSInteger puzzlesCount;

@end
