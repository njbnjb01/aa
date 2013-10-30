/**
*		@author   
*		@version 2.0
* 		@date: 
*	<pre> 
*  medialib Api Class : 
*	
*  	
*/
//////code examples
/**


**/
dynamic class Actions.Album {

/**Attr Type:**/
	public static var ML_ST_FILE_NAME 						= 0x01;  //it is needed
	public static var ML_ST_FILE_SIZE 						= 0x02;  /**store file size*/
	public static var ML_ST_FILE_TIME						= 0x04;  /**store file time*/
	public static var ML_ST_FILE_PATH						= 0x08; //it is needed 
	
	///photo
	public static var ML_ST_EXIF_EXPTIME 					= 0x10;  /**store photo capture time*/
	public static var ML_ST_EXIF_HEIGHT					= 0x20;
	public static var ML_ST_EXIF_WIDTH					= 0x40;

	//music
	public static var ML_ST_ID3_ARTISTS					= 0x100;
	public static var ML_ST_ID3_ALBUM						= 0x200;
	public static var ML_ST_ID3_GENRES					= 0x400;
	public static var ML_ST_ID3_COMPOSER					= 0x800;
	public static var ML_ST_ID3_TIME						= 0x1000;

	//user tag
	public static var ML_ST_USER_TAG1						= 0x2000;

	//the system is using TAG1 to store the user tag,and others is not used recently
	public static var ML_ST_USER_TAG2						= 0x4000;
	public static var ML_ST_USER_TAG3						= 0x8000;
	public static var ML_ST_USER_TAG4						= 0x10000;
	public static var ML_ST_USER_TAG5						= 0x20000;
/**Attr Type  End**/

//minfo_type
	public static var ML_MTYPE_PHOTO						=0;
	public static var ML_MTYPE_MUSIC						=1;
	public static var ML_MTYPE_VIDEO						=2;

//view mode
	public static var ML_VM_REMOVE_DUPLCATE				=2;
	public static var ML_VM_FITLER_BYVALUE_EQUAL			=4;
	public static var ML_VM_FITLER_BYVALUE_BITEQUAL		=8;
	public static var ML_VM_PURE_SORT						=16;

//search  mode
	public static var ML_SEARCH_MODE_SEQUENCE			=1;
	public static var ML_SEARCH_MODE_REVERSE				=2;

//modify mode 
	public static var ML_MODIFY_MODE_CHANGETO			=1;
	public static var ML_MODIFY_MODE_SETBITS				=2;
	public static var ML_MODIFY_MODE_CLRBITS				=3;

/**Tag value*/
 	public static var ML_TAG_TAG1							= 0x01;	
	public static var ML_TAG_TAG2							= 0x02;
	public static var ML_TAG_TAG3							= 0x04;
	public static var ML_TAG_TAG4							= 0x08;
	public static var ML_TAG_TAG5							= 0x10;
	public static var ML_TAG_TAG6							= 0x20;
	public static var ML_TAG_TAG7							= 0x40;
	public static var ML_TAG_TAG8							= 0x80;
	public static var ML_TAG_TAG9							= 0x100;
	public static var ML_TAG_TAG10							= 0x200;
	public static var ML_TAG_TAG11							= 0x400;
	public static var ML_TAG_TAG12							= 0x800;
	public static var ML_TAG_TAG13							= 0x1000;
	public static var ML_TAG_TAG14							= 0x2000;
	public static var ML_TAG_TAG15							= 0x4000;
	public static var ML_TAG_TAG16							= 0x8000;
/**Tag Vaue End**/


/**command get info**/
	public static var CMD_GET_FILE_PATH						=0x0;
	public static var CMD_GET_FILE_NAME						=0x1;
	public static var CMD_GET_FILE_TIME						=0x2;
	public static var CMD_GET_FILE_SIZE						=0x3;

	public static var CMD_GET_EXIF_WIDTH						=0x4;
	public static var CMD_GET_EXIF_HEIGHT						=0x5;
	public static var CMD_GET_EXIF_EXPTIME					=0x6;	

	public static var  CMD_GET_ID3_ARTISTS					=0x7;
	public static var  CMD_GET_ID3_ALBUM						=0x8;
	public static var  CMD_GET_ID3_GENRES						=0x9;

	public static var CMD_GET_USER_TAG1						=0x0a;

/**get db create status**/
	public static var DB_CREATING							=0x0;  //db is creating
	public static var DB_CREATE_OK							=0x1;	//creating db succeed
	public static var DB_CREATE_FAIL						=0x2;	//creating db failed


	
	/**this fuction is call to open the database of specified mediatype**/
	/**
	*@param
		m_type: ML_MTYPE_PHOTO etc,which is the same as createDB
	*@param
		db_name: the name of db which will be opened
	*@return
		0:failed
		others: the handle of db which is opened
	**/
      	public static function openDB(m_type:Number,dbname:String):Number
	{
		return ExternalInterface.call("album_openDB",m_type,dbname);
	}

	
	/**this fuction is call to close the database of specified mediatype**/
	/**
	*@param
		db_handle: which is returned from openDB
	*@return
		-1:failed
		0:succeed
	**/
	public static function closeDB(db_handle:Number):Number
	{
		return ExternalInterface.call("album_closeDB",db_handle);
	}	


	/**this fuction is call to create the database of specified mediatype**/
	/**
	*@param
		rootpath: the db is created based on the files which were searched under rootpath
	*@param
		attrtype:ML_ST_FILE_NAME,etc.
		this value specified which information should be stored in the database,
	*@param
		fileext : the extention of files such as "JPG BMP JPEG TIFF"
	*@param
		dbname:name the db, it will be used when openDB is called 
	*@param
		m_type: ML_MTYPE_PHOTO etc;
	*@return:
		the total file num under the media 
		if value = -1 it means it is failed to get the number or creat the sacntask failed;
		if value = -2 it means create the task succeed
	**/
	public static function createDB(rootpath:String,attrtype:Number,fileext:String,dbname:String,m_type:Number):Number
	{
		return ExternalInterface.call("album_createDB",rootpath,attrtype,fileext,dbname,m_type);
	}		


	/**this function is call to destory the specified db **/
	/**
	*@param
		m_type: ML_MTYPE_PHOTO etc,which is the same as createDB
	*@param
		db_name: the name of db which will be destroyed
	*@return
		-1:failed
		0:succeeded
	**/
	public static function destroyDB(m_type:Number,dbname:String):Number
	{
		return ExternalInterface.call("album_destoryDB",m_type,dbname);
	}


	/**
	*this function is call for updating DB
	*@param
		dbhandle:the handle of the db which will be updated
	*@return:
		-1: failed
		0: succeed
	*/
	public static function updateDB(dbhandle:Number):Number
	{
		return ExternalInterface.call("album_updateDB",dbhandle);
	}

	/**
	*this function is used for getting the task status 
	*@param
		none
	*@return
		DB_CREATING etc
	*/
	public static function getDBCreateStatus():Number
	{
		return ExternalInterface.call("album_getDBCreateStatus");
	}


	/**this function is called for finding an item in database**/
	/**
	*@param
		dbhandle:get from opendb etc
	*@param
		metadata_type: the same as Attr Type,ML_ST_FILE_NAME etc
	*@param
		value:the value is used to filteing the useless data
	*@param
		viewmode: ML_VM_REMOVE_DUPLCATE etc
		the viewmode will determine whether the value be used
		if viewmode==ML_VM_PURE_SORT,the value will not be used
	*@param
		viewhandle:create the new view based on the view which is specified by viewhandle. if based on default view, the viewhandl==0
	*@return
		0:failed
		others: the handle to the view which is opened
	*/
	public static function openView(dbhandle:Number,metadata_type:Number,value:String,viewmode:Number,viewhandle:Number):Number
	{
		return ExternalInterface.call("album_openView",dbhandle,metadata_type,value,viewmode,viewhandle);
	}

	/**close a view which is opened**/
	/**
	*@param
		viewhandle:the handle of a view which is opened
	*@return
		0:failed
		-1:failed
	*/
	public static function closeView(viewhandle:Number):Number
	{
		return ExternalInterface.call("album_closeView",viewhandle);
	}


	/**get the number of files in the specified view**/
	/**
	*@param
		viewhandle:the handle of a view which is opened
		if the viewhandle==0, it will get the num of default view
	*@return
		0:failed
		-1:failed
	*/
	 public static function getNum(viewhandle:Number):Number
	{
		return ExternalInterface.call("album_getNum",viewhandle);
	}




	/**this function is called for deleting an item in database**/
	/**
	*@param
		viewhandle: the handle of view which got from openview
		fileidx: the logical index in the view
	*@return
		0: succeed
		-1: failed
	*/
	public static function delItem(viewhandle:Number,fileidx:Number):Number
	{
		return ExternalInterface.call("album_delItem",viewhandle,fileidx);
	}


	/**this function is called for adding the specified to the dabase which is opened**/
	/**
	*@param
		dbhandle:the handle of db which is opened
	*@param
		filefullpath: the full path of the file
	*@param
		tagvalue: consider as a attribute of the file
	*@return:
		-1: failed
		0: succeed
	*/
	public static function addItem(dbhandle:Number,filefullpath:String,tagvalue:Number):Number
	{
		return ExternalInterface.call("album_addItem",dbhandle,filefullpath,tagvalue);
	}

	/**this function is called for finding an item in database**/
	/**
	*@param:
		viewhandle: the handle of a view that is opened
	*@param:
		metadata_type:  the same as Attr Type,ML_ST_FILE_NAME etc
	*@param
		value: the value to be search,it is a String type,you should change the Number to String
	*@param:
		search_mode:ML_SEARCH_MODE_SEQUENCE etc
	*@return
		-1: failed, can't find the index of a file which is suited for the condition
		others: the index of the file which is suited for the condition
	*/
	public static function findItem(viewhandle:Number,metadata_type:Number,value:String,search_mode:Number):Number
	{
		return ExternalInterface.call("album_findItem",viewhandle,metadata_type,value,search_mode);
	}


	/**this function is called for modifying an item in database**/
	/**
	*@param
		viewhandle: the handle of a view which is opened
	*@param
		fileidx: the logical index in the view
	*@param:
		metadata_type: the same as Attr Type,ML_ST_FILE_NAME etc
	*@param
		value: the new value to be set
	*@param:
		md_mode:ML_MODIFY_MODE_CHANGETO etc
	*@return
		0: succeed
		-1: failed
	*/
	public static function modifyItem(viewhandle:Number,fileidx:Number,metadata_type:Number,value:String,md_mode:Number){
		return ExternalInterface.call("album_modifyItem",viewhandle,fileidx,metadata_type,value,md_mode);
	}


	/**this function is called for getting information**/
	/**
	*@param
		viewhandle: the value returned from openView
	*@param
		fileidx: the logical index in the view 
	*@param
		info_mode: CMD_GET_FILE_PATH etc
	*@return
		if info_mode == CMD_GET_FILE_PATH
			the filepath of the file
		if info_mode == CMD_GET_FILE_NAME:
			the file name
		if info_mode == CMD_GET_FILE_TIME
			time of last modification
		if info_mode == CMD_GET_USER_TAG
			get the user tag which is stored in USER_TAG1
	*/
	public static function getInfo(viewhandle:Number,fileidx:Number,info_mode:Number):String
	{
		return ExternalInterface.call("album_getInfo",viewhandle,fileidx,info_mode);
	}



}

