//
//  main.m
//  HellGlow World
//
//  Created by Fhict on 04/09/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlowAct.h"
#import "City.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        GlowAct* blueLightAct = [[GlowAct alloc]init];
        blueLightAct.Name = @"The BlueLight Act";
        blueLightAct.StartTime = @"22:00" ;
        blueLightAct.Rating = 8;
        
        GlowAct* redLightAct = [[GlowAct alloc]init];
        redLightAct.Name = @"The RedLight Act";
        redLightAct.StartTime = @"14:00";
        redLightAct.Rating = 2;
        
        City* Eindhoven = [[City alloc]init];
        Eindhoven.Name = @"Eindhoven";
        Eindhoven.Population = 220000;
        [Eindhoven.glowActs addObject:(blueLightAct) ];
        [Eindhoven.glowActs addObject:(redLightAct)];
        Eindhoven.Acts = [Eindhoven.glowActs count];
        [Eindhoven ShowInfo];
    }
}

