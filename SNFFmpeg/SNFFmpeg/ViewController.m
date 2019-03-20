//
//  ViewController.m
//  SNFFmpeg
//
//  Created by snlo on 2019/1/10.
//  Copyright © 2019 snlo. All rights reserved.
//

#import "ViewController.h"

#import <mobileffmpeg/mobileffmpeg.h>
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
	}
}


@end
