//
//  CalendarManager.h
//  test1
//
//  Created by hbjmyl on 15/12/22.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "RCTBridgeModule.h"

@interface CalendarManager : NSObject <RCTBridgeModule>

@property(nonatomic,strong)NSTimer *time;

@end
