//
//  Dice.m
//  Threelow
//
//  Created by Dayson Dong on 2019-05-01.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentValue = 0;
        _isHeld = NO;
    }
    return self;
}

- (void)rolldice {
    
    int index = arc4random_uniform(6);
    self.currentValue = index;
}

- (NSString *)description
{
    switch (self.currentValue) {
        case 0:
            return @"⚀";
            break;
        case 1:
            return @"⚁";
            break;
        case 2:
            return @"⚂";
            break;
        case 3:
            return @"⚃";
            break;
        case 4:
            return @"⚄";
            break;
        case 5:
            return @"⚅";
            break;
            
        default:
            return 0;
            break;
    }
}

@end
