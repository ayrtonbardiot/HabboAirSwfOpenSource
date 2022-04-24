// by nota

//com.sulake.core.utils._SafeStr_1587

package com.sulake.core.utils
{
    import flash.system.Capabilities;

    public class _SafeStr_1587 
    {

        private static var _majorVersion:int;
        private static var _majorRevision:int;
        private static var _SafeStr_5295:String;

        {
            init();
        }


        public static function get majorVersion():int
        {
            return (_majorVersion);
        }

        public static function get majorRevision():int
        {
            return (_majorRevision);
        }

        public static function get operatingSystem():String
        {
            return (_SafeStr_5295);
        }

        private static function init():void
        {
            var _local_1:String = Capabilities.version;
            var _local_3:Array = _local_1.split(" ");
            var _local_2:Array = _local_3[1].split(",");
            _SafeStr_5295 = _local_3[0];
            _majorVersion = parseInt(_local_2[0]);
            _majorRevision = parseInt(_local_2[1]);
        }


    }
}//package com.sulake.core.utils

// _SafeStr_1587 = "_-Qi" (String#8330, DoABC#3)
// _SafeStr_5295 = "_-QE" (String#8315, DoABC#3)


