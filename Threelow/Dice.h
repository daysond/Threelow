//
//  Dice.h
//  Threelow
//
//  Created by Dayson Dong on 2019-05-01.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject
@property (nonatomic) NSInteger currentValue;
@property (nonatomic) NSArray* diceValue;
@property (nonatomic) NSString* dieValue;
@property (nonatomic) BOOL isHeld;
-(void)rolldice;

@end

NS_ASSUME_NONNULL_END
