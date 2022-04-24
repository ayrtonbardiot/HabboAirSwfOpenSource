// by nota

//com.sulake.core.utils._SafeStr_68

package com.sulake.core.utils
{
    import flash.utils.ByteArray;

    public /*dynamic*/ interface _SafeStr_68 
    {

        function clearCache():void;
        function localFilePath(_arg_1:String):String;
        function cacheFilePath(_arg_1:String):String;
        function loadLocalBitmapData(_arg_1:String, _arg_2:Function):void;
        function cacheFileExists(_arg_1:String):Boolean;
        function localFileExists(_arg_1:String):Boolean;
        function readCache(_arg_1:String):ByteArray;
        function readCacheAsync(_arg_1:String, _arg_2:Function):void;
        function writeCache(_arg_1:String, _arg_2:ByteArray):void;
        function writeCacheAsync(_arg_1:String, _arg_2:ByteArray):void;
        function deleteCacheDirectory(_arg_1:String):void;
        function swapObjectToDisk(_arg_1:Object):int;
        function swapObjectFromDisk(_arg_1:int):Object;

    }
}//package com.sulake.core.utils

// _SafeStr_68 = "_-H1s" (String#7683, DoABC#3)


