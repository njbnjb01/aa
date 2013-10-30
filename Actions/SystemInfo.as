
/**
 *	@author  
 *	@version 1.0
 *  @date: 
 *	<pre>  
 *  SystemInfo Class 
 		system related control
 *  </pre>
 *	<pre>
 	Example:
 *  	sd_in = SystemInfo.checkCardStatus();
 *		cf_in = SystemInfo.checkCFStatus();
 *		udisk_in = SystemInfo.checkUsbStatus();	
 *	</pre>
 */

dynamic class Actions.SystemInfo {
	 
/**
*@addtogroup SystemInfo_as
*@{
*/
	public static var SYS_CLOCKMODE_12 = 0;		///< clock mode:12
	public static var SYS_CLOCKMODE_24 = 1;		///< clock mode:24
	public static var SYS_ALARMRING_1 = 0;		///< alarm ring 1
	public static var SYS_ALARMRING_2 = 1;		///< alarm ring 2
	public static var SYS_ALARMRING_3 = 2;		///< alarm ring 3
	public static var SYS_MEDIA_INTERNAL = 0;	///< store media:internal memory
	public static var SYS_MEDIA_SD = 1;			///< store media:SD/MMC/MS/XD card
	public static var SYS_MEDIA_CF = 2;			///< store media:CF card
	public static var SYS_MEDIA_UDISK = 3;		///< store media:Usb mass storage media
	public static var SYS_MEDIA_DONGLE =4;		///< wifi dongle
	public static var SYS_SET_MUTE = 100;		///< CMD  to SET MUTE/Cancel mute
	public static var MT_DONGLE =10;			///dongle media type, used in acceptHotplugInfo() function
	
	///< Func  to SET color
	public static var COLOR_Hue = 1;			///< Hue func
	public static var COLOR_Saturation = 2;		///< Saturation func
	public static var COLOR_Brightness = 3;		///< Brightness func
	public static var COLOR_Contrast = 4;		///< Contrast func
	public static var COLOR_Sharpness = 5;		///< Sharpness func

	///< Mode Read or Write  to SET color
	public static var Mode_Read = 0;				///< read mode
	public static var Mode_Write = 1;			///< write mode


	///< Card Upgrade State
	public static var CARD_STATE_INIT = 0; 		///< initing
	public static var CARD_STATE_WAIT = 1; 	///< waiting
	public static var CARD_STATE_RUNUING = 2; 	///< running
	public static var CARD_STATE_FINISHED = 3; 		///< finished
	public static var CARD_STATE_ERROR = 4; 		///< error

	///< backlight
	public static var BACKLIGHT_DEF_VALUE = 31; 	///< backlight max value


	///< ddr pll for change_pll()
	public static var DDR_LOW_PLL= 196; ///< clock rate 196M
	public static var DDR_HIGH_PLL=392; ///< clock rate 392M


	///< get global value cmd
	public static var CMD_GET_GLONUM=0; ///< get num
	public static var CMD_GET_GLOSTR=1;///< get string


	///< card type
	public static var CARD_TYPE_SD =1;///< sd card
	public static var CARD_TYPE_MMC =2;///< mmc card
	public static var CARD_TYPE_MS =3;///< ms card
	public static var CARD_TYPE_MS_PRO =4;///< ms pro card
	public static var CARD_TYPE_XD =5;///< xd card
	
	///< access mode, these may be OR'd together
	public static var MODE_R_OK=4 ; ///< test for read permission
	public static var MODE_W_OK=2; ///< test for write permission
	public static var MODE_X_OK =1; ///< test for execute permission
	public static var MODE_F_OK = 0; ///< test for existence
	
    /**
	 * @brief	set system volume
	 * @param[in] newVolume	: range is 0~10,SYS_SET_MUTE 
	  	as 0~10 id normal volume, the SYS_SET_MUTE will mute the volume
	 * @return 
	 * 	- -1	: failed
	 *	- 0	: succeed
	 */
	public static function setVolume(newVolume:Number):Number
	{
		return ExternalInterface.call("sys_setVolume", newVolume);
	}
    
    /**
	 * @brief	get system volume
	 * @param[in] NULL
	 * @return 
	 *		- volume (0~10)
	 *		- SYS_SET_MUTE the volume is mute
	 */
	public static function getVolume():Number
	{
		return ExternalInterface.call("sys_getVolume");
	}
    
    /**
	 * @brief	get firmware version
	 * @param[in] NULL
	 * @return 
	 *		version string
	 */
	public static function getFwVersion():String
	{
		return ExternalInterface.call("sys_getFwVersion");
	}
	
	/**
	 * @brief	get internal storage total capacity(kbytes)
	 * @param[in] NULL
	 * @return 
	 *		total capacity if success or <0 if fail
	 */
	public static function getDiskSpace():Number
	{
		return ExternalInterface.call("sys_getDiskSpace");
	}
	
	/**
	 * @brief	get internal storage free capacity(kbytes)
	 * @param[in] NULL
	 * @return 
	 *		free capacity if success or <0 if fail
	 */
	public static function getDiskSpaceLeft():Number
	{
		return ExternalInterface.call("sys_getDiskSpaceLeft");
	}
	
	/**
	 * @brief	get card storage total capacity(kbytes)
	 * @param[in] NULL
	 * @return 
	 *		total capacity if success or <0 if fail
	 */
	public static function getCardSpace():Number
	{
		return ExternalInterface.call("sys_getCardSpace");
	}
	
	/**
	 * @brief	get card storage free capacity(kbytes)
	 * @param[in] NULL
	 * @return 
	 *		free capacity if success or <0 if fail
	 */
	public static function getCardSpaceLeft():Number
	{
		return ExternalInterface.call("sys_getCardSpaceLeft");
	}
	
	/**
	 * @brief	get CF card storage total capacity(kbytes)
	 * @param[in] NULL
	 * @return 
	 *		total capacity if success or <0 if fail
	 */
	public static function getCFSpace():Number
	{
		return ExternalInterface.call("sys_getCFSpace");
	}
	
	/**
	 * @brief	get CF card storage free capacity(kbytes)
	 * @param[in] NULL
	 * @return 
	 *		free capacity if success or <0 if fail
	 */
	public static function getCFSpaceLeft():Number
	{
		return ExternalInterface.call("sys_getCFSpaceLeft");
	}
	
	/**
	 * @brief	get usb mass storage media total capacity(kbytes)
	 * @param[in] NULL
	 * @return 
	 *		total capacity if success or <0 if fail
	 */
	public static function getUSBSpace():Number
	{
		return ExternalInterface.call("sys_getUSBSpace");
	}
	
	/**
	 * @brief	get usb mass storage media free capacity(kbytes)
	 * @param[in] NULL
	 * @return 
	 *		free capacity if success or <0  if fail
	 */
	public static function getUSBSpaceLeft():Number
	{
		return ExternalInterface.call("sys_getUSBSpaceLeft");
	}	
	
	/**
	 * @brief	set backlight strength
	 * @param[in] strength	: strength to be set
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setBackLightStrength(strength:Number):Boolean
	{
		return ExternalInterface.call("sys_setBackLightStrength", strength);
	}
	
	/**
	 * @brief	get backlight strength
	 * @param[in] NULL
	 * @return 
	 *		back light strengh if success of <0 if fail
	 */
	public static function getBackLightStrength():Number
	{
		return ExternalInterface.call("sys_getBackLightStrength");
	}

	/**
	 * @brief	Interface to Adjust color
	 * @param[in] Func	: Which func to select
	 *				- COLOR_Hue			:	1
	 *				- COLOR_Saturation	:	2
	 *				- COLOR_Brightness	:	3
	 *				- COLOR_Contrast	:	4
	 *				- COLOR_Sharpness	:	5
	 * @param[in] Mode	: Read or Write
	 *				- Mode_Read		:	0
	 *				- Mode_Write	:	1
	 * @param[in] Valuein	: value to trans in,max&min listed below
	 *				- COLOR_Hue     	-60 ---- 60
	 *				- COLOR_Saturation	-64 ---- 128
	 *				- COLOR_Brightness	-128 ---- 127
	 *				- COLOR_Contrast	-64 ---- 64
	 *				- COLOR_Sharpness	-31 ---- 31
	 * @return the selected func
	 *				- COLOR_Hue			:	1
	 *				- COLOR_Saturation	:	2
	 *				- COLOR_Brightness	:	3
	 *				- COLOR_Contrast	:	4
	 *				- COLOR_Sharpness	:	5
	 */
	public static function ColorAdjustIO(func:Number,mode:Number,valuein:Number):Number
	{
		return ExternalInterface.call("sys_ColorAdjustIO",func,mode,valuein);
	}
	
	/**
	 * @brief	get current time: year
	 * @param[in] NULL
	 * @return
	 *		year if success or <0 if fail
	 */
	public static function getYear():Number
	{
		return ExternalInterface.call("sys_getYear");
	}
	
	/**
	 * @brief	set current: year
	 * @param[in] newVal	: year to be set
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setYear(newVal:Number):Boolean
	{
		return ExternalInterface.call("sys_setYear", newVal);
	}
	
	/**
	 * @brief	get current time: month
	 * @param[in] NULL
	 * @return
	 *		month if success or <0 if fail
	 */
	public static function getMonth():Number
	{
		return ExternalInterface.call("sys_getMonth");
	}
	
	/**
	 * @brief	set current: month
	 * @param[in] newVal	: month to be set
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setMonth(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setMonth", newVal);
	}
	
	
	/**
	 * @brief	get current time: day
	 * @param[in] NULL
	 * @return
	 *		day if success or <0 if fail
	 */
	public static function getDay():Number
	{
		 return ExternalInterface.call("sys_getDay");
	}
	/**
	 * @brief	set current: day
	 * @param[in] newVal	: day to be set
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setDay(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setDay", newVal);
	}

	/**
	 * @brief	get current time: wday
	 * @param[in] NULL
	 * @return
	 *		wday if success or <0 if fail(0:Sunday;1-6:Monday-Saterday)
	 */
	public static function getWday():Number
	{
		 return ExternalInterface.call("sys_getWday");
	}

	
	/**
	 * @brief	get current time: hour
	 * @param[in] NULL
	 * @return
	 *		hour if success or <0 if fail
	 */
	public static function getHour():Number
	{
		 return ExternalInterface.call("sys_getHour");
	}
	/**
	 * @brief	set current: hour
	 * @param[in] newVal	: hour to be set
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setHour(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setHour", newVal);
	}	
	
	/**
	 * @brief	get current time: minute
	 * @param[in] NULL
	 * @return
	 *		minute if success or <0 if fail
	 */
	public static function getMin():Number
	{
		 return ExternalInterface.call("sys_getMin");
	}
	/**
	 * @brief	set current: minute
	 * @param[in] newVal	: minute to be set
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setMin(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setMin", newVal);
	}	
	
	/**
	 * @brief	get current time: second
	 * @param[in] NULL
	 * @return
	 *		second if success or <0 if fail
	 */
	public static function getSecond():Number
	{
		 return ExternalInterface.call("sys_getSecond");
	}
	/**
	 * @brief	set current: second
	 * @param[in] newVal	: second to be set
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setSecond(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setSecond", newVal);
	}
	
	
	/**
	 * @brief	get current time mode
	 * @param[in] NULL
	 * @return  	 
	 * - 0	:	SYS_CLOCKMODE_12
	 * - 1	:	SYS_CLOCKMODE_24
	 */
	public static function getClockMode():Number
	{
		 return ExternalInterface.call("sys_getClockMode");
	}
	/**
	 * @brief	set time mode
	 * @param[in] newVal	: new time mode
	 * 			- SYS_CLOCKMODE_12
	 * 			- SYS_CLOCKMODE_24	 
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setClockMode(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setClockMode", newVal);
	}			
	
	/**
	 * @brief	get alarm time: hour
	 * @param[in] NULL
	 * @return
	 *		alarm time hour if success or <0 if fail
	 */
	public static function getAlarmHour():Number
	{
		 return ExternalInterface.call("sys_getAlarmHour");
	}
	/**
	 * @brief	set alarm time: houre
	 * @param[in] newVal	: new hour
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setAlarmHour(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAlarmHour", newVal);
	}		
	
	
	/**
	 * @brief	get alarm time: minute
	 * @param[in] NULL
	 * @return
	 *		alarm time minute if success or <0 if fail
	 */
	public static function getAlarmMin():Number
	{
		 return ExternalInterface.call("sys_getAlarmMin");
	}
	/**
	 * @brief	set alarm time: minute
	 * @param[in] newVal	: new minute
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setAlarmMin(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAlarmMin", newVal);
	}
	
	/**
	 * @brief	get alarm enable status
	 * @param[in] NULL
	 * @return
	 * - 0	:	disable
	 * - 1	:	enable
	 */
	public static function getAlarmEnable():Number
	{
		 return ExternalInterface.call("sys_getAlarmEnable");
	}
	/**
	 * @brief	set alarm enable 
	 * @param[in] newVal	: new alarm number
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setAlarmEnable(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAlarmEnable", newVal);
	}				
	
	
	/**
	 * @brief	get alarm ring
	 * @param[in] NULL
	 * @return
	 * - 0	:	SYS_ALARMRING_1
	 * - 1	:	SYS_ALARMRING_2
	 * - 2	:	SYS_ALARMRING_3 	 
	 */
	public static function getAlarmRing():Number
	{
		 return ExternalInterface.call("sys_getAlarmRing");
	}
	/**
	 * @brief	set alarm ring
	 * @param[in] newVal	: new alarm ring
	 * 			- SYS_ALARMRING_1
	 * 			- SYS_ALARMRING_2
	 * 			- SYS_ALARMRING_3 	 
	 * @return
	 *		true if success or false if fail
	 */
	public static function setAlarmRing(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAlarmRing", newVal);
	}

	/**
	 * @brief	store your config change to memory\n
	 *  As you use any Function with App_Vram_write(...) \n
	 *  this function is required . 
	 * @param[in] NULL
	 * @return NULL
	 */
	public static function storeConfig():Boolean
	{
		return ExternalInterface.call("sys_storeConfig");
	}


	
	/**
	 * @brief	get current language identification
	 * @param[in] NULL
	 * @return 
	 *		current language id
	 */
	public static function getCurLanguage():Number
	{
	    return ExternalInterface.call("sys_getCurLanguage");
	}
	
	/**
	 * @brief	set current language id
	 * @param[in] newId	: the new language id
	 * @return 
	 *		true if success or false if fail
	 */
	public static function setCurLanguage(newId:Number):Boolean
	{
	    return ExternalInterface.call("sys_setCurLanguage", newId);
	}

	/**
	 * @brief	get number of language that the system support
	 * @param[in] NULL
	 * @return 
	 *		the number of language can be support
	 */
	public static function getLanguageTotalNum():Number
	{
	    return ExternalInterface.call("sys_getLanguageTotalNum");
	}

	/**
	 * @brief	get which language matched with the index
	 * @param[in] idx	: the range of this value is from 0 to the returned value of getLanguageTotalNum()
	 * @return 
	 *		language string, such as "en"
	 */
	public static function getLanguageIdx2Str(idx:Number):String
	{
	    return ExternalInterface.call("sys_getLanguageIdx2Str",idx);
	}
	
	/**
	 * @brief	check if card inserted
	 * @param[in] NULL
	 * @return 
	 * - true	: already insert
	 * - false	: not inserted
	 */
	public static function systUpgrade():Boolean
	{
		return ExternalInterface.call("sys_systUpgrade");
	}
	

	
	/**
	 * @brief	check if card inserted
	 * @param[in] NULL
	 * @return 
	 * - true	: already insert
	 * - false	: not inserted
	 */
	public static function checkCardStatus():Boolean
	{
		return ExternalInterface.call("sys_checkCardStatus");
	}
		
	/**
	 * @brief	check 4in1 card inserted type
	 * @param[in] NULL
	 * @return 
	 *		cardtype	:	sd/mmc/ms/xd see CARD_TYPE_SD etc
	 */
	public static function checkCardType():Number
	{
		return ExternalInterface.call("sys_checkCardType");
	}
	/**
	 * @brief	check if CF card inserted
	 * @param[in] NULL
	 * @return 
	 * - true	:	already insert
	 * - false	:	not inserted
	 */
	public static function checkCFStatus():Boolean
	{
		return ExternalInterface.call("sys_checkCFStatus");
	}
	
	/**
	 * @brief	check if CF card inserted
	 * @param[in] NULL
	 * @return 
	 * - true	:	already insert
	 * - false	:	not inserted
	 */
	public static function setVideoAutoPlayStatus(newId:Number):Number
	{
		return ExternalInterface.call("sys_setVideoAutoPlayStatus",newId);
	}

	/**
	 * @brief	check if CF card inserted
	 * @param[in] NULL
	 * @return 
	 * - true	:	already insert
	 * - false	:	not inserted
	 */
	public static function getVideoAutoPlayStatus():Number
	{
		return ExternalInterface.call("sys_getVideoAutoPlayStatus");
	}
	
	/**
	 * @brief	check if USB inserted
	 * @param[in] NULL
	 * @return 
	 * - true	:	already insert
	 * - false	:	not inserted
	 */
	public static function checkUsbStatus():Boolean
	{
		return ExternalInterface.call("sys_checkUsbStatus");
	}
	

	/**
	 * @brief	get AutoPower Start able
	 * @param[in] NULL
	 * @return
	 * - 0	:	disable
	 * - 1	:	enable
	 */
	public static function getAutoPowerOnFlag():Number
	{
		 return ExternalInterface.call("sys_getAutoPowerOnFlag");
	}
	/**
	 * @brief	set  AutoPower Start able
	 * @param[in] newVal	:	0-disable;1-enable	 
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setAutoPowerOnFlag(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAutoPowerOnFlag", newVal);
	}					
	

   /**
	 * @brief	get AutoPower Start Hour
	 * @param[in] NULL
	 * @return
	 *		Number	:	hour---24 mode   
	 */
	public static function getAutoPowerOnHour():Number
	{
		 return ExternalInterface.call("sys_getAutoPowerOnHour");
	}

	   
	/**
	 * @brief	set  AutoPower Start Hour
	 * @param[in] newVal	: hour---24 mode 
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setAutoPowerOnHour(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAutoPowerOnHour", newVal);
	}				

	/**
	 * @brief	get AutoPower Start Minute
	 * @param[in] NULL
	 * @return
	 * - Number	:	Minute---0~59
	 */
	public static function getAutoPowerOnMin():Number
	{
		 return ExternalInterface.call("sys_getAutoPowerOnMin");
	}

	   
	/**
	 * @brief	set  AutoPower Start Minute
	 * @param[in] newVal	: Minute---0~59
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setAutoPowerOnMin(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAutoPowerOnMIn", newVal);
	}		

	
	/**
	 * @brief	get AutoPower close able
	 * @param[in] NULL
	 * @return
	 * - 0	:	disable
	 * - 1	:	enable    
	 */
	public static function getAutoPowerOffFlag():Number
	{
		 return ExternalInterface.call("sys_getAutoPowerOffFlag");
	}

	   
	/**
	 * @brief	set  AutoPower  close able
	 * @param[in] newVal	: 0-disable;1-enable
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setAutoPowerOffFlag(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAutoPowerOffFlag", newVal);
	}		
	

	/**
	 * @brief	get AutoPower close Hour
	 * @param[in] NULL
	 * @return
     *		number : hour---24 mode   
	 */
	public static function getAutoPowerOffHour():Number
	{
		 return ExternalInterface.call("sys_getAutoPowerOffHour");
	}

	   
	/**
	 * @brief	set  AutoPower  close Hour
	 * @param[in] newVal	: hour---24 mode
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setAutoPowerOffHour(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAutoPowerOffHour", newVal);
	}		
	

	/**
	 * @brief	get AutoPower close minute
	 * @param[in] NULL
	 * @return
     *		number	:	minute---0~59 
	 */
	public static function getAutoPowerOffMin():Number
	{
		 return ExternalInterface.call("sys_getAutoPowerOffMin");
	}

	   
	/**
	 * @brief	set  AutoPower  close minute
	 * @param[in] newVal	: minute---0~59
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setAutoPowerOffMin(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAutoPowerOffMin", newVal);
	}		


	/**
	 * @brief	get AutoPower Freq
	 * @param[in] NULL
	 * @return
	 * - 0	:	disable
	 * - 1	:	enable 
	 */
	public static function getAutoPowerFreq():Number
	{
		 return ExternalInterface.call("sys_getAutoPowerFreq");
	}

	   
	/**
	 * @brief	set  AutoPower  Freq
	 * @param[in] newVal	: autopower frequency 
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setAutoPowerFreq(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAutoPowerFreq", newVal);
	}		

	/**
	 * @brief	get media type from media number
	 * @param[in] newVal	: media type
	 *				- SYS_MEDIA_INTERNAL
	 *				- SYS_MEDIA_SD
	 *				- SYS_MEDIA_CF
	 *				- SYS_MEDIA_UDISK
	 * @return  
	 *		"C""D""E""F"......
	 */
	public static function media2Disk(newVal:Number):String
	{
		 return ExternalInterface.call("sys_media2Disk", newVal);
	}	
	
	/**
	 * @brief	set the media to be active
	 * @param[in] media	: media to set
	 *				- SYS_MEDIA_INTERNAL
	 *				- SYS_MEDIA_SD
	 *				- SYS_MEDIA_CF
	 *				- SYS_MEDIA_UDISK
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setActiveMedia(media:Number):Number
	{
		 return ExternalInterface.call("sys_setActiveMedia", media);
	}

	/**
	 * @brief	reset system to default setting
	 * @param[in] NULL
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function resetDefaultSetting():Boolean
	{
	    return ExternalInterface.call("sys_resotreSysDefaultConfig");
	}
	
	/**
	 * @brief	get the working path, e.g. c:\ d:\ ...
	 * @param[in] NULL
	 * @return 
	 *		the working path
	 */
	public static function getActiveWorkPath():String
	{
		return ExternalInterface.call("sys_getActiveWorkPath");
	}
	
	/**
	 * @brief	clear all key message remained in flash playing task
	 * @param[in] NULL
	 * @return NULL
	 */
	public static function clearKeyMessage():Void
	{
		ExternalInterface.call("sys_clearKeyMessage");
	}	

	/**
	 * @brief	enable the printer
	 * @param[in] isenable	: enable or disable the printer
	 * @return
	 *		true if succsee or false if fail
	 */
	public static function enablePrinter(isenable:Number):Number
	{
		return ExternalInterface.call("sys_enablePrinter",isenable);
	}
	
	/**
	 * @brief	get the disk symbol for private disk
	 * @param[in] NULL
	 * @return
	 *		the disk symbol or 'C' for default
	 */
	public static function getPrivateDiskSymbol():String
	{
		return ExternalInterface.call("sys_getPrivateDiskSymbol");
	}
	
	/**
	 * @brief	tell player that the hotplub information has been accepted
	 * @param[in] mediaType	: card or cf or usb
	 * @param[in] plugType	: 0 for plugout and 1 for plugin
	 * @return NULL
	 */
	public static function acceptHotplugInfo(mediaType:Number,plugType:Number):Void
	{
		ExternalInterface.call("sys_acceptHotplugInfo",mediaType,plugType);
	}
	/**
	* @brief	tell player that the usb device information has been accepted
	* @param[in] plugType	: 0 for plugout and 1 for plugin
	* @return NULL
	*/
	public static function acceptPCconInfo(plugType:Number):Void
	{
		ExternalInterface.call("sys_acceptPCconInfo",plugType);
	}

	/**
	 * @brief	check usb device status when machine startup
	 * @param NULL
	 * @return 
	 *		connect status:
	 *			1:	connected
	 *			0:	disconnected
	 */
	public static function checkStartupUstatus():Number
	{
		return ExternalInterface.call("sys_checkStartupUstatus");
	}
	/**
	 * @brief	set HDMI Mode
	 * @param[in] ModeType	: HDMI mode to set
	 * @return 
	 *		true if succsee or false if fail
	 * 
	 */
	public static function setHDMIMode(ModeType:Number):Boolean
	{
		 return ExternalInterface.call("sys_setHDMIMode", ModeType);
	}

	/**
	 * @brief	get HDMI Mode
	 * @param[in] NULL
	 * @return 
	 *		ModeType	: HDMI mode 
	 */
	public static function getHDMIMode():Number
	{
		 return ExternalInterface.call("sys_getHDMIMode");
	}

	/**
	 * @brief	set Output previous Mode when this mode is error
	 * @param[in] NULL
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setOutputPrevMode():Boolean
	{
		 return ExternalInterface.call("sys_setOutputPrevMode");
	}

	/**
	 * @brief	set Output Mode
	 * @param[in] OutputMode	:  Output mode to set(1-HDMI;	2-CVBS;	4-YPbPr)
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function setOutputMode(OutputMode:Number):Boolean
	{
		 return ExternalInterface.call("sys_setOutputMode",OutputMode);
	}
	
	/**
	 * @brief	get Output Mode
	 * @param[in] NULL
	 * @return 
	 *		OutputMode
	 *		- 1	:	HDMI
	 *		- 2	:	CVBS
	 *		- 4	:	YPbPr
	 */
	public static function getOutputMode():Number
	{
		 return ExternalInterface.call("sys_getOutputMode");
	}

	/**
	 * @brief	get Output Mode
	 * @param[in] param index	:
	 *				- 1		get screen width
	 *				- 2		get screen height
	 * @return 
	 *		true if succsee or false if fail
	 */
	public static function getCurscreenParam(paramIndex:Number):Number
	{
		 return ExternalInterface.call("sys_getCurscreenparam",paramIndex);
	}
	/**
	 * @brief	get the number of sectors when the mass storage is multi secotr
	 * @param[in] NULL
	 * @return
	 *		the number of the sectors
	 */
	public static function getMultiSectorNum():Number
	{
		return ExternalInterface.call("sys_getMultiSectorNum");
	}
	
	/**
	@brief get the status of upgrading 
	@param[in] NULL
	@return the status which the lower 8 bits is the processing and the next 8 bits is the state
	**/
	public static function getCardUpgradeStatus():Number
	{
		return ExternalInterface.call("sys_getCardUpgradeStatus");
	}

	/**
	 * @brief	get Auto Screen off able
	 * @param[in] NULL
	 * @return
	 * - 0	:	disable
	 * - 1	:	enable
	 */
	public static function getAutoScreenOffFlag():Number
	{
		 return ExternalInterface.call("sys_getAutoScreenOffFlag");
	}

	/**
	 * @brief	set  Auto Screen off able
	 * @param[in] newVal	:	0-disable;1-enable	 
	 * @return 
	 *		0 if succsee or -1 if fail
	 */
	public static function setAutoScreenOffFlag(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAutoScreenOffFlag", newVal);
	}					
	
   /**
	 * @brief	get Auto Screen off time
	 * @param[in] NULL
	 * @return
	 *		Number	:	Auto Screen off time
	 */
	public static function getAutoScreenOffTime():Number
	{
		 return ExternalInterface.call("sys_getAutoScreenOffTime");
	}
 
	/**
	 * @brief	set  Auto Screen off time
	 * @param[in] newVal	: Auto Screen off time
	 * @return 
	 *		0 if succsee or -1 if fail
	 */
	public static function setAutoScreenOffTime(newVal:Number):Boolean
	{
		 return ExternalInterface.call("sys_setAutoScreenOffTime", newVal);
	}		
	
  /**
   * @brief Get battery charging status.
   *
   * @return The charging status:
      - UNKNOWN
      - CHARGING
      - DISCHARGING
      - NOT_CHARGING
      - FULL
   */
	public static function getBatteryChargeStatus():String
	{
		 return ExternalInterface.call("sys_getBatteryChargeStatus");
	}	
	
	

  /**
   * @brief Get battery current voltage.
   *
   * @return A string reprent the current voltage.
   */
	public static function getBatteryVoltage():String
	{
		 return ExternalInterface.call("sys_getBatteryVoltage");
	}			

	/**
	 * @brief	change ddr pll
	 * @param[in] clock	: cloce rate see DDR_LOW_PLL etc..
	 * @return 
	 *		0 if succsee or -1 if fail
	 */
	public static function changePll(clock:Number):Number
	{
		 return ExternalInterface.call("sys_change_pll", clock);
	}	

	/**
	@brief get the global value 
	@param[in] cmd: get num or get str, see CMD_GET_GLONUM
	@param[in] index: the index of the num or str
	@return 
		if the cmd==CMD_GET_GLONUM, you should convert the string which returnd to the num by yourself
		else 
			get the str
		if string returned is NULL, it means get value failed
	**/
	public static function getGlobalValue(cmd:Number,index:Number):String
	{
		 return ExternalInterface.call("sys_getGlobalValue", cmd,index);
	}	
	
	/**
	 * @brief	execute standby
	 * @param[in] NULL
	 * @return 
	 *		0 if succsee or -1 if fail
	 */
	public static function Standby():Number
	{
		 return ExternalInterface.call("sys_Standby");
	}


	/**
	 * @brief	access the path where had the specified mode
	 * @param[in] path : it can be a dir or a file
	 * @param[in] mode : see MODE_R_OK etc
	 * @return 
	 *		0 if success or -1 if fail
	 */
	public static function access(path:String,mode:Number):Number
	{
		 return ExternalInterface.call("sys_Access");
	}

	/**
	 * @brief	execute softap
	 * @param[in] NULL
	 * @return 
	 *		0 if succsee or -1 if fail
	 */
	public static function Softap():Number
	{
		 return ExternalInterface.call("sys_Softap");
	}

	public static function checkMediaStatus(media_type:Number):Boolean
	{
		 return ExternalInterface.call("sys_checkMediaStatus",media_type);
	}
	
/**
 *@}
 */
}
