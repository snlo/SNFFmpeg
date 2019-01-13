# SNFFmpeg
<a href= "https://snlo.app/2019/01/04/FFmpeg系列之编译/" target="_blank">FFmpeg系列之编译</a>

<a href= "https://github.com/snlo/SNFFmpeg/blob/master/FFmpeg-iOS-build-script/build-ffmpeg.sh" target="_blank">编译脚本</a>

## ffmpeg命令

ffmpeg [ global_options ] {[ input_file_options ] -iinput_url} ... {[ output_file_options ]output_url} ...

视频转GIF：

```swift
"ffmpeg -i video.avi video.gif"
```

视频提取音频：

```swift
"ffmpeg -i video.avi -f wav -ar 16000 video.wav"
```



未完待续... ...



## 参考

<a href= "https://trac.ffmpeg.org" target="_blank">FFmpeg Wiki</a>

<a href= "https://github.com/kewlbear/FFmpeg-iOS-build-script" target="_blank">FFmpeg-iOS-build-script</a>

<a href= "https://github.com/tanersener/mobile-ffmpeg" target="_blank">MobileFFmpeg </a>