//
//  GlowAct.h
//  HellGlow World
//
//  Created by Fhict on 04/09/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlowAct : NSObject

@property NSString* Name;
@property NSInteger Rating;
@property NSString* StartTime;

- (id) init;
- (void) ShowInfo;

@end
