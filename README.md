# Smart210_gboot

1.建立交叉编译环境
	Step1:Linux 目录中的 arm-linux-gcc-4.5.1-v6-vfp-20101103.tgz 复制到linux系统的目录下如，然后进入到该目录/home/Smart210，执行解压命令:
	#cd /home/Smart210
	#tar zxvpf arm-linux-gcc-4.5.1-v6-vfp-20120301.tgz -C /
	注意： C 后面有个空格，并且 C 是大写的，它是英文单词“ Change”的第一个字母，在此是改变目录的意思。
	执行该命令，将把 arm-linux-gcc 安装到/opt/FriendlyARM/toolschain/4.5.1 目录。
	Step2:把编译器路径加入系统环境变量，运行命令
	#gedit /root/.bashrc
	编辑 /root/.bashrc 文件， 注意“bashrc”前面有一个“.”，修改最后一行为
	export PATH=$PATH:/opt/FriendlyARM/toolschain/4.5.1/bin， 注意路径一定要写对，否则将不会有效。

	



















	


