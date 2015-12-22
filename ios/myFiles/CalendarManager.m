//
//  CalendarManager.m
//  test1
//
//  Created by hbjmyl on 15/12/22.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "CalendarManager.h"
#import <UIKit/UIKit.h>
#import "RCTConvert.h"
#import "RCTEventDispatcher.h"

@interface CalendarManager()

{
  int isDisplayed,isFirst;
  void(^RCTResponseSenderBlock)();
}

@end

@implementation CalendarManager
@synthesize bridge = _bridge;
RCT_EXPORT_MODULE();

//RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(NSDate *)date){
//  
//  
//}

//RCT_EXPORT_METHOD(addEvent:(NSString *)name details:(NSDictionary *)details)
//{
//  
//  NSString *location = [RCTConvert NSString:details[@"location"]];
//  NSDate *time = [RCTConvert NSDate:details[@"time"]];
//  
//  NSLog(@"js传过来的数据 %@ --- %@ --- %@\n", name, location ,time);
//  
//  if ([name isEqualToString:@"test"])
//  {
//    _time=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector() userInfo:nil repeats:YES];
//    NSLog(@"我要测试通信机制怎么用\n");
//  }
//  
//}


- (instancetype)init
{
  self = [super init];
  if (self) {
    isDisplayed=0;
    isFirst=0;
    _time=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(yanshi) userInfo:nil repeats:YES];
  }
  return self;
}

RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback)
{
  NSArray *events = @[@"test the block",@"the second parameter"];
 
  callback(@[[NSNull null], events]);
  NSLog(@"我要测试通信机制怎么用wēwewewewew5e5we5w5e5w5e5w5e5w5e\n");
}


-(void)yanshi
{
//  NSLog(@"我要测试通信机制怎么用wēwewewewew5e5we5w5e5w5e5w5e5w5e\n");
  ++isDisplayed;
  
  NSNotification *Notify=[[NSNotification alloc]initWithName:@"testName" object:nil userInfo:@{@"name":@"2555555"}];
  [self calendarEventReminderReceived:Notify];
  
}



- (void)calendarEventReminderReceived:(NSNotification *)notification
{
  NSString *eventName = notification.userInfo[@"name"];
  [self.bridge.eventDispatcher sendAppEventWithName:@"EventReminder"
                                               body:@{@"name": eventName}];
}




@end
