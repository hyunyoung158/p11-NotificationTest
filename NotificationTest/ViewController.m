//
//  ViewController.m
//  NotificationTest
//
//  Created by SDT-1 on 2014. 1. 20..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation ViewController

- (IBAction)notiNow:(id)sender {
    UILocalNotification *noti = [[UILocalNotification alloc]init];
    noti.alertBody = @"노티 테스트";
    noti.alertAction = @"확인";
    
    NSLog(@"%@", noti.userInfo);
    //아릶창은 안나타나지만 appdelegate 의 메소는 실행된다.
    [[UIApplication sharedApplication] presentLocalNotificationNow:noti];
    
}

- (IBAction)fireNotiIn7:(id)sender {
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.fireDate = [NSDate dateWithTimeIntervalSinceNow:7];
    noti.alertBody = @"7 seconds";
    noti.alertAction = @"확인";
    noti.soundName = UILocalNotificationDefaultSoundName;
    
    noti.userInfo = nil;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];
}

- (IBAction)fireNoti:(id)sender {
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.fireDate = self.datePicker.date;
    noti.alertBody = @"지정 시간 알림";
    noti.alertAction = @"확인";
    //30초 이내의 사운드
    noti.soundName = @"sound.mp3";
    //앱 구동시 잠깐 나타나는 런치 이미지
    noti.alertLaunchImage = @"image.jpg";
    noti.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"object", @"key", nil];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
