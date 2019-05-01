//
//  InputHandler.m
//  Threelow
//
//  Created by Dayson Dong on 2019-05-01.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

-(NSString *)outputString {
    
    char userInput[255];
    fgets(userInput, 255, stdin);
    NSString* userIputString = [[NSString stringWithUTF8String:userInput] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return userIputString;
}

@end
