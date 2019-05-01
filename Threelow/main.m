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
        NSString* dices = @"";
        NSString* heldDices = @"";
        
       
        
        while (YES) {
            NSLog(@"\nEnter a command:\nroll - Roll dices\nhold i - Enter die index to hold/unhold e.g hold 1 2\nreset - Unhold all the dices");
            NSString* userInput = [inputHandler outputString];
            dices = @"";
            heldDices = @"";
            
            if ([userInput isEqualToString:@"roll"]) {
                
                if (rollCount < 2) {
                    
                    for (Dice* die in [gameController dices]) {
                        
                        if (die.isHeld == NO) {
                            [die rolldice];
                        }
                    }
                    rollCount ++;

                } else {
                    NSLog(@"NO MORE ROLL.");
                }
                
            } else if ( [userInput length]> 4 && [[userInput substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"hold"] ) {
                
                NSString* indexesInString = [userInput substringWithRange:NSMakeRange(5, [userInput length] -5)];
                NSArray* indexes = [indexesInString componentsSeparatedByString:@" "];
                for (NSString* index in indexes) {
                    if ([index intValue] != 0) {
                        if ([index intValue] > 5 || [index intValue] < 1) {
                            NSLog(@"Do not have that die.");
                        } else {
                            [gameController holdDie:[index intValue] - 1];
                        }
                    }
                }

            } else if ([userInput isEqualToString:@"reset"]) {
                [gameController resetDice];

            } else {
                NSLog(@"Enter a valid command.");
            }
            
            for (Dice* die in [gameController dices]) {
                
                if (die.isHeld == NO) {
                    dices = [dices stringByAppendingString:[NSString stringWithFormat:@"%@ ",die]];
                    heldDices = [heldDices stringByAppendingString:[NSString stringWithFormat: @"_ "]];
                } else {
                    dices = [dices stringByAppendingString:[NSString stringWithFormat:@"%@ ",die]];
                    heldDices = [heldDices stringByAppendingString:[NSString stringWithFormat: @"%@ ",die]];
                }
            }
            NSLog(@"dices:%@, held[%@], score: %ld",dices,heldDices,[gameController getScore]);
        
            // end of while
        }
    }
    return 0;
}
