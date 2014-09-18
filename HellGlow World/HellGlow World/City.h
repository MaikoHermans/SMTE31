//
//  City.h
//  HellGlow World
//
//  Created by Fhict on 04/09/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property NSString* Name;
@property NSInteger Population;
@property NSInteger Acts;
@property NSMutableArray* glowActs;

- (void) ShowInfo;
-(id) init;

@end
