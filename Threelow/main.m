//
//  main.m
//  Threelow
//
//  Created by Dayson Dong on 2019-05-01.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        GameController* gameController = [[GameController alloc]init];

        gameController.heldDices = [[NSMutableArray alloc]init];

        InputHandler* inputHandler = [[InputHandler alloc]init];
        
        int rollCount = 0;

        while (YES) {
            NSLog(@"Enter a command:\nroll - Roll dices\nhold - Hold dices\nreset - Unhold all the dices");
            NSString* userInput = [inputHandler outputString];
            
            if ([userInput isEqualToString:@"roll"]) {
                
                if (rollCount < 2) {
                    NSString* dices = @"";
                    NSString* heldDices = @"";
                    
                    for (Dice* die in [gameController dices]) {
                        
                        if (die.isHeld == NO) {
                            [die rolldice];
                            dices = [dices stringByAppendingString:[NSString stringWithFormat:@"%@",die]];
                        } else {
                            dices = [dices stringByAppendingString:[NSString stringWithFormat:@"%@",die]];
                            heldDices = [heldDices stringByAppendingString:[NSString stringWithFormat: @"%@",die]];
                        }
                    }
                    
                    NSLog(@"dices:%@, held[%@], score: %ld",dices,heldDices,[gameController getScore]);
                    rollCount ++;
                } else {
                    NSLog(@"NO MORE ROLL.Score:%ld",[gameController getScore]);
                }
            
                
                
            } else if ([userInput isEqualToString:@"hold"]) {
                                NSLog(@"Enter the index of the die?");
                userInput = [inputHandler outputString];
                [gameController holdDie:[userInput intValue]];
                
            } else if ([userInput isEqualToString:@"reset"]) {
                [gameController resetDice];
            }
        }
    }
    return 0;
}
