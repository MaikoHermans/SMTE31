//
//  City.m
//  HellGlow World
//
//  Created by Fhict on 04/09/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "City.h"
#import "GlowAct.h"

@implementation City

@synthesize Name;
@synthesize Population;
@synthesize Acts;
@synthesize glowActs;

-(void) ShowInfo
{
    for(GlowAct *r in glowActs)
    {
        [r ShowInfo];
    }
    NSLog(@"In the city of %@ there are currently living %ld people. And there are %ld acts.", Name, Population, Acts );
}

-(id) init
{
    if(self == [super init])
    {
        self.glowActs = [[NSMutableArray alloc]init];
    }
    return self;
}



@end
