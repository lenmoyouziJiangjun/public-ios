//
//  XMGAudioTool.m
//  02-播放音效
//
//  Created by xiaomage on 15/8/15.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGAudioTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation XMGAudioTool

static NSMutableDictionary *_soundIDs;

+ (void)initialize
{
    _soundIDs = [NSMutableDictionary dictionary];
}

//+ (NSMutableDictionary *)soundIDs
//{
//    if (_soundIDs == nil) {
//        _soundIDs = [NSMutableDictionary dictionary];
//    }
//    
//    return _soundIDs;
//}

+ (void)playSoundWithSoundname:(NSString *)soundname
{
    // 1.定义SystemSoundID
    SystemSoundID soundID = 0;
    
    // 2.从字典中取出对应soundID,如果取出是nil,表示之前没有存放在字典
    soundID = [_soundIDs[soundname] unsignedIntValue];
    if (soundID == 0) {
        //获取support file文件的url
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundname withExtension:nil];
        //创建id
        AudioServicesCreateSystemSoundID(url, &soundID);
        
        // 将soundID存入字典
        [_soundIDs setObject:@(soundID) forKey:soundname];
    }
    
    // 3.播放音效
    AudioServicesPlaySystemSound(soundID);
}

@end
