//
//  ViewController.m
//  SNFFmpeg
//
//  Created by snlo on 2019/1/10.
//  Copyright © 2019 snlo. All rights reserved.
//

#import "ViewController.h"

#import <Mobileffmpeg/MobileFFmpeg.h>
#import <mobileffmpeg/fftools_ffmpeg.h>

#import "SNFileManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self handleFrameImageFromMP4];
    return;
	
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
    
    
    int rc = [MobileFFmpeg execute:[NSString stringWithFormat:@"-i %@ -c:a libfdk_aac -vbr 5 %@output.m4a",AUfromFile,[SNFileManager parentPathAtPath:AUfromFile]]];
    
    if (rc == RETURN_CODE_SUCCESS) {
        NSLog(@"成功");
    } else if (rc == RETURN_CODE_CANCEL) {
        NSLog(@"取消");
    } else {
        NSLog(@"失败");
    }
    
    
    
    [MobileFFmpeg cancel];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        char *outPic = (char *)[fromFile UTF8String];
        char *movie = (char *)[fromFile UTF8String];
        char logo[1024];
        // 左上
        sprintf(logo, "movie=%s [logo]; [in][logo] overlay=30:10 [out]", [fromFile UTF8String]);
        
        // 左下
        //sprintf(logo, "movie=%s [logo]; [in][logo] overlay=30:main_h-overlay_h-10 [out]", [BundlePath(@"ff.jpg") UTF8String]);
        
        // 右下
        //sprintf(logo, "movie=%s [logo]; [in][logo] overlay=main_w-overlay_w-10:main_h-overlay_h-10 [out]", [BundlePath(@"ff.jpg") UTF8String]);
        
        // 右上
        //sprintf(logo, "movie=%s [logo]; [in][logo] overlay=main_w-overlay_w-10:10 [out]", [BundlePath(@"ff.jpg") UTF8String]);
        
        char* a[] = {
            "ffmpeg",
            "-i",
            movie,
            "-vf",
            logo,
            outPic
        };
        ffmpeg_parse_options(sizeof(a)/sizeof(*a), a);
    });
    
    
    
    
    
}

    
- (void)handleFrameImageFromMP4 {
    
    NSString * fromFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];
    
    NSLog(@"fromFile : %@",fromFile);
    NSString * toFile = [SNFileManager parentPathAtPath:fromFile];
    NSLog(@"toFile : %@",toFile);
    
//    [MobileFFmpeg execute:[NSString stringWithFormat:@"-y -ss 1 -i %@ -vframes 10 -f image2 -s 100x100 %@img\%03d.png",fromFile, toFile]];
//
    
    MediaInformation * media =  [MobileFFmpeg getMediaInformation:fromFile];
    
    NSLog(@" -- - : %@",[media getDuration]);
    
//    [MobileFFmpeg execute:[NSString stringWithFormat:@"-y -i %@ -vf \"drawtext=fontfile=CourierNew.ttf:text='helloworld':x=10:y=5:fontsize=12\" %@xxx.mp4",fromFile, toFile]];
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        char *from = (char *)[fromFile UTF8String];
//        char *to = (char *)[toFile UTF8String];
//
//        char* a[] = {
//            "ffmpeg",
//            "-y",
//            "-ss",
//            "1",
//            "-i",
//            from,
//            "-vframes",
//            "10",
//            "-f",
//            "image2",
//            "-s",
//            "100x100",
//            "img%03d.png"
//        };
//        ffmpeg_parse_options(sizeof(a)/sizeof(*a), a);
//    });
    
}
    

@end
