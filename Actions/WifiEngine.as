
/**
 *	@author   
 *	@version 1.0
 *  @date	: 
 *	<pre>  
 *  WifiEngine 
 		wifi setting control
 *	</pre>
 *  <pre>
 	Example:
 *		WifiEngine.Open();	
 *		when exit:
 *		WifiEngine.Close();
 *	</pre>
 */

 dynamic class Actions.WifiEngine {

/**
*@addtogroup WifiEngine_as
*@{
*/
	public static var AUTHEN_WPA=0;		///< authen type:wpa
	public static var AUTHEN_WEP=1;		///< authen type:wep
	public static var AUTHEN_OPEN=2;	///< authen type:open

	public static var WIFI_DISCONNECTED=-1;	///< WPA_DISCONNECTED - Disconnected state
	public static var WIFI_COMPLETED=0;		///< WPA_COMPLETED - All authentication completed
	public static var WIFI_INACTIVE=1;		///< WPA_INACTIVE - Inactive state (wpa_supplicant disabled)
	public static var WIFI_SCANNING=2;		///< WPA_SCANNING - Scanning for a network
	public static var WIFI_ASSOCIATING=3;	///< WPA_ASSOCIATING - Trying to associate with a BSS/SSID
	public static var WIFI_ASSOCIATED=4;	///< WPA_ASSOCIATED - Association completed
	public static var WIFI_4WAY_HANDSHAKE=5;///< WPA_4WAY_HANDSHAKE - WPA 4-Way Key Handshake in progress
	public static var WIFI_GROUP_HANDSHAKE=6;///<WPA_GROUP_HANDSHAKE - WPA Group Key Handshake in progress
	public static var WIFI_AUTO_IP_ERROR=7;	///< wlan status:associated
	public static var WIFI_AUTO_IP_SUCCESS=8;	///< wlan status:associated

	public static var INDEX_OUTRANGE=1;		///< set pwd:AP index out of range
	public static var WPA_PWD_ERROR=2;		///< set pwd:WPA mode, password length must be in [8,63]
	public static var WEP_PWD_ERROR=3;		///< set pwd:WEP mode, if Hex, password length must 10 or 26 or 32, if ASCII, password length must 5 or 13 or 16
	public static var PORT_ERROR=4;			///< ifconfig [port]:port is not exist

	/**
	 *@brief	open WifiEngine
	 *@param[in] NULL
	 *@return 
	 *		true if success or false if fail
	 */
	public static function Open():Boolean
	{
		return ExternalInterface.call("wifi_Open");
	}
	
	/**
	 *@brief	close WifiEngine
	 *@param[in] NULL
	 *@return NULL
	 */
	public static function Close()
	{
		return ExternalInterface.call("wifi_Close");
	}

	/**
	 *@brief	start WifiEngine
	 *@param[in] NULL
	 *@return true if success or false if fail
	 */
	public static function Start():Number
	{
		return ExternalInterface.call("wifi_Start");
	}

	/**
	 *@brief	start scan AP
	 *@param[in] NULL
	 *@return true if success or false if fail
	 */
	public static function StartScan():Number
	{
		return ExternalInterface.call("wifi_StartScan");
	}
	
	/**
	 *@brief	get scan results
	 *@param[in] NULL
	 *@return AP num
	 */
	public static function GetScanResults():Number
	{
		return ExternalInterface.call("wifi_GetScanResults");
	}

	/**
	 *@brief	stop Wifi
	 *@param[in] NULL
	 *@return NULL
	 */
	public static function Stop()
	{
		return ExternalInterface.call("wifi_Stop");
	}

	/**
	 *@brief	get AP ssid
	 *@param[in] NULL
	 *@return 0 if success or -1 if fail
	 */
	public static function AddNetwork():Number
	{
		return ExternalInterface.call("wifi_AddNetwork");
	}
	
	/**
	 *@brief	get AP ssid
	 *@param[in] index : index of AP
	 *@return ap ssid
	 */
	public static function GetSsid(index:Number):String
	{
		return ExternalInterface.call("wifi_GetAPSsid",index);
	}

	/**
	 *@brief	set AP ssid
	 *@param[in] index : index of AP
	 *@param[in] ssid : ssid to set
	 *@return 0 if success or -1 if fail
	 */
	public static function SetSsid(index:Number,ssid:String):Number
	{
		return ExternalInterface.call("wifi_SetAPSsid",index,ssid);
	}

	/**
	 *@brief	get AP signal level
	 *@param[in] index : index of AP
	 *@return ap signal level
	 */
	public static function GetSignal(index:Number):Number
	{
		return ExternalInterface.call("wifi_GetSingal",index);
	}

	/**
	 *@brief	check conf file exists or not
	 *@param[in] index : index of AP
	 *@return 0 if conf file does not exist or 1 if conf file exists
	 */
	public static function GetConfExist(index:Number):Number
	{
		return ExternalInterface.call("wifi_GetConfExist",index);
	}

	/**
	 *@brief	set AP password
	 *@param[in] index : index of AP
	 *@param[in] wep_keyindex : index of wep key [0,3]
	 *@return 0 if success or -1 if fail
	 */
	public static function SetWEPKeyIndex(index:Number,wep_keyindex:Number):Number
	{
		return ExternalInterface.call("wifi_SetWEPKeyIndex",index,wep_keyindex);
	}
	
	/**
	 *@brief	set AP password
	 *@param[in] index : index of AP
	 *@param[in] password : AP password
	 *@return 0 if success or -1 if fail
	 */
	public static function SetPassword(index:Number,password:String):Number
	{
		return ExternalInterface.call("wifi_SetPassword",index,password);
	}

	/**
	 *@brief	save conf file 
	 *@param[in] NULL
	 *@return 0 if success or -1 if fail
	 */
	public static function SaveConf():Number
	{
		return ExternalInterface.call("wifi_SaveConf");
	}

	/**
	 *@brief	connect selected AP
	 *@param[in] NULL
	 *@return 0 if success or -1 if fail
	 */
	public static function ConnectAP():Number
	{
		return ExternalInterface.call("wifi_ConnectAP");
	}

	/**
	 *@brief	get AP Authen type
	 *@param[in] index : index of AP
	 *@return AP authen type
	 */
	public static function GetAuthenType(index:Number):Number
	{
		return ExternalInterface.call("wifi_GetAuthenType",index);
	}

	/**
	 *@brief	set AP Authen type
	 *@param[in] index : index of AP
	 *@param[in] auth_type : auth_type of AP
	 *@return 0 if success or -1 if fail
	 */
	public static function SetAuthenType(index:Number,auth_type:Number):Number
	{
		return ExternalInterface.call("wifi_SetAuthenType",index,auth_type);
	}

	/**
	 *@brief	get now status
	 *@param[in] NULL
	 *@return now wlan0 status
	 */
	public static function GetStatus():Number
	{
		return ExternalInterface.call("wifi_GetStatus");
	}

	/**
	 *@brief	set wpa_supplicant default config
	 *@param[in] NULL
	 *@return 0 if success or -1 if fail
	 */
	public static function SetDefault():Number
	{
		return ExternalInterface.call("wifi_SetDefault");
	}

	/**
	 *@brief	get index of selected AP
	 *@param[in] NULL
	 *@return index of selected AP
	 */
	public static function GetIndexofSelectAP():Number
	{
		return ExternalInterface.call("wifi_GetIndexofSelectAP");
	}

	/**
	 *@brief	set wlan IP address
	 *@param[in] ip_addr : wlan IP address
	 *@return 0 if success or -1 if fail
	 */
	public static function SetIPAddress(ip_addr:String):Number
	{
		return ExternalInterface.call("wifi_SetIPAddress",ip_addr);
	}

	/**
	 *@brief	get wlan IP address
	 *@param[in] NULL
	 *@return wlan IP address
	 */
	public static function GetIPAddress():String
	{
		return ExternalInterface.call("wifi_GetIPAddress");
	}

	/**
	 *@brief	set wlan router
	 *@param[in] router : wlan router IP address
	 *@return 0 if success or -1 if fail
	 */
	public static function SetRouter(router:String):Number
	{
		return ExternalInterface.call("wifi_SetRouter",router);
	}

	/**
	 *@brief	get wlan router
	 *@param[in] NULL
	 *@return wlan router
	 */
	public static function GetRouter():String
	{
		return ExternalInterface.call("wifi_GetRouter");
	}

	/**
	 *@brief	set wlan DNS server
	 *@param[in] DNS_index : wlan DNS index
	 *@param[in] DNS_server : wlan DNS server IP address
	 *@return 0 if success or -1 if fail
	 */
	public static function SetDNS(DNS_index:Number,DNS_server:String):Number
	{
		return ExternalInterface.call("wifi_SetDNS",DNS_index,DNS_server);
	}

	/**
	 *@brief	get wlan DNS server
	 *@param[in] NULL
	 *@return wlan DNS server
	 */
	public static function GetDNS():String
	{
		return ExternalInterface.call("wifi_GetDNS");
	}

	/**
	 *@brief	delete conf file
	 *@param[in] index : index of AP
	 *@return 0 if success or -1 if fail
	 */
	public static function DeleteConf(index:Number):Number
	{
		return ExternalInterface.call("wifi_DeleteConf",index);
	}

	/**
	 *@brief	auto connect AP which has been connected before
	 *@param[in] NULL
	 *@return 0 if success or -1 if fail
	 */
	public static function AutoConnect():Number
	{
		return ExternalInterface.call("wifi_Autoconnect");
	}

/**
 *@}
 */
 
 }
 

