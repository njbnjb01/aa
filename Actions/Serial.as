


dynamic class Actions.Serial {
	//设置串口屏向外部发送数据的crc校验开关
	//crcflag,0：关闭，1：打开
	public static function crcswitch(crcflag:Number):Void
	{
     	ExternalInterface.call("crc_filew",crcflag);
	}
	//设置通道开关
	//channel为通道号，范围1-255；chflag，0：关闭，1：打开
	public static function channelswitch(channel:Number,chflag:Number):Void
	{
     	ExternalInterface.call("channel_switch",channel,chflag);
	}
	
	//发送数据unicode编码，直接由串口传出
	public static function senddata(datalength:Number,serialdata:String):Void
	{
     	ExternalInterface.call("serial_send",datalength,serialdata);
	}
	
	//发送unicode编码\u0101(代表0),\u0002-00FF,底层将其转换成16进制数字码\x00-FF，由串口传出
	public static function senddata1(datalength:Number,serialdata:String):Void
	{
     	ExternalInterface.call("serial_send1",datalength,serialdata);
	}
	
	//接收串口数据。
	//5-220通道为专用转换通道，底层会将这些通道传入的16进制数字码\x00-FF转换为unicode编码\u0101(代表0),\u0002-00FF
	public static function getdata(serialdata:Number):String
	{
     	return ExternalInterface.call("serial_rev",serialdata);
	}
	
	//设置串口速率
	public static function sendspeed(serialdata:Number)
	{
     	ExternalInterface.call("send_speed",serialdata);
	}
	//设置背光时间
	public static function backlighttime(serialdata0:Number,serialdata1:Number)
	{
     	ExternalInterface.call("backlighti_time",serialdata0,serialdata1);
	}
	
	public static function reboot():Void
	{
     	ExternalInterface.call("reboot_");
	}
	public static function shutdown():Void
	{
     	ExternalInterface.call("shutdown_");
	}
	public static function sync():Void
	{
     	ExternalInterface.call("sync_");
	}
	//返回当前串口速率
	public static function nowSerialSpeed():Number
	{
     	return ExternalInterface.call("send_serialspeed");
	}
	//返回已保存的背光强度
	public static function nowBackLightStrength():Number
	{
     	return ExternalInterface.call("send_backstrength");
	}
	//返回当前背光延时关闭时间
	public static function nowBackLightTime():Number
	{
     	return ExternalInterface.call("send_backlighttime1");
	}
	//返回背光延时使能
	public static function backLightEnable():Number
	{
     	return ExternalInterface.call("send_backlighttime");
	}
	
	public static function psPrinter(serialdata:String):Number
	{
     	 return ExternalInterface.call("ps_printer",serialdata);
	}
	//蜂鸣器开关
	//参数 0：开  1：关
	public static function setbuzzer(serialdata:Number):Void
	{
     	ExternalInterface.call("set_buzzer",serialdata);
	}
	//蜂鸣器响
	//参数 1:0.1秒
	public static function buzzerctrl(serialdata:Number):Void
	{
     	ExternalInterface.call("buzzer_ctrl",serialdata);
	}
	//返回蜂鸣器状态
	//
	public static function getbuzzer():Number
	{
     	return ExternalInterface.call("get_buzzer");
	}
	//启动检测程序
	//0正常；1启动异常，请重新烧写固件或检查硬件
	public static function bootcheck():Number
	{
     	return ExternalInterface.call("boot_check");
	}
	//固件返回版本号
	public static function getversion():String
	{
     	return ExternalInterface.call("get_version");
	}
	//返回SD卡状态
	//0未挂载，1挂载不能写，2挂载可写
	public static function checksd():Number
	{
     	return ExternalInterface.call("check_sd");
	}
	
}

	