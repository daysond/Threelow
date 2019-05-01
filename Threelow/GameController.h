//
//  GameController.h
//  Threelow
//
//  Created by Dayson Dong on 2019-05-01.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property NSArray* dices;
@property NSMutableArray* heldDices;

-(void)holdDie: (NSInteger) dieIndex;
-(void)resetDice;
-(NSInteger)getScore;

@end

NS_ASSUME_NONNULL_END
