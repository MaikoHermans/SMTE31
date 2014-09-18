//
//  GlowAct.m
//  HellGlow World
//
//  Created by Fhict on 04/09/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "GlowAct.h"
#import "City.h"


@implementation GlowAct

@synthesize Name;
@synthesize StartTime;
@synthesize Rating;

- (void) ShowInfo
{
    
    NSLog(@"The act is called %@ and will start at %@. People gave it a rating of %ld", Name, StartTime, Rating);
}

@end
