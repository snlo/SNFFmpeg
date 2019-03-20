//
//  ViewController.m
//  SNFFmpeg
//
//  Created by snlo on 2019/1/10.
//  Copyright © 2019 snlo. All rights reserved.
//

#import "ViewController.h"

#import <mobileffmpeg/mobileffmpeg.h>
#import <mobileffmpeg/fftools_ffmpeg.h>
#import "SNFileManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
	
	NSString * fromFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];
	NSLog(@"沙盒目录：%@",fromFile);
	NSString * toFile = [SNFileManager parentPathAtPath:fromFile];

	if (![MobileFFmpeg execute:[NSString stringWithFormat:@"-i %@ %@test.gif",fromFile,toFile]]) {
		NSLog(@"gif转换👌");
	}
    if (![MobileFFmpeg execute:[NSString stringWithFormat:@"-i %@ -f wav -ar 16000 %@test.wav",fromFile,toFile]]) {
        NSLog(@"音频提取👌");

//        ffmpeg -i input.mp3 -c:a libfdk_aac -vbr 5 output.m4a

    }
    NSString * AUfromFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"wav"];
    if ([MobileFFmpeg execute:[NSString stringWithFormat:@"-i %@ -c:a libfdk_aac -vbr 5 %@output.m4a",AUfromFile,[SNFileManager parentPathAtPath:AUfromFile]]] < 1) {
        NSLog(@".m4a转码成功");
    }
    
    
    
}


@end
