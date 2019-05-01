//
//  GameController.m
//  Threelow
//
//  Created by Dayson Dong on 2019-05-01.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        Dice *dice1 = [[Dice alloc]init];
        Dice *dice2 = [[Dice alloc]init];
        Dice *dice3 = [[Dice alloc]init];
        Dice *dice4 = [[Dice alloc]init];
        Dice *dice5 = [[Dice alloc]init];
        
        _dices = [[NSArray alloc]initWithObjects:
                  dice1,
                  dice2,
                  dice3,
                  dice4,
                  dice5,
                  nil];
        
        _heldDices = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)holdDie:(NSInteger)dieIndex {
    
    if ([self.heldDices containsObject:self.dices[dieIndex]]) {
        // unhold
        [self.heldDices removeObject:self.dices[dieIndex]];
        [self.dices[dieIndex] setIsHeld:NO];
        NSLog(@"die is held? %hhd",[self.dices[dieIndex] isHeld]);
    } else {
        [self.heldDices addObject:self.dices[dieIndex]];
        [self.dices[dieIndex] setIsHeld:YES];
    }
}

-(void)resetDice {
    
    [self.heldDices removeAllObjects];
    for (Dice* die in self.dices) {
        [die setIsHeld:NO];
    }
}

- (NSInteger)getScore {
    NSInteger score = 0;
    for (Dice* die in self.dices) {
        if(die.currentValue != 2 ) {
           score += die.currentValue + 1;
        }
        
    }
     return score;
}

@end
