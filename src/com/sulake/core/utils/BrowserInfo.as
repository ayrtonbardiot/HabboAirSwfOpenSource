// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.utils.BrowserInfo

package com.sulake.core.utils
{
    public class BrowserInfo 
    {

        public static const _SafeStr_8090:String = "win";
        public static const MAC_PLATFORM:String = "mac";
        public static const SAFARI_AGENT:String = "safari";
        public static const _SafeStr_8091:String = "opera";
        public static const IE_AGENT:String = "msie";
        public static const MOZILLA_AGENT:String = "mozilla";
        public static const CHROME_AGENT:String = "chrome";

        private var _SafeStr_8092:String = "undefined";
        private var _SafeStr_8093:String = "undefined";
        private var _version:String = "undefined";

        public function BrowserInfo(_arg_1:Object, _arg_2:Object, _arg_3:String)
        {
            if ((((!(_arg_1)) || (!(_arg_2))) || (!(_arg_3))))
            {
                return;
            };
            _version = _arg_1.version;
            for (var _local_5:String in _arg_1)
            {
                if (_local_5 != "version")
                {
                    if (_arg_1[_local_5] == true)
                    {
                        _SafeStr_8093 = _local_5;
                        break;
                    };
                };
            };
            for (var _local_4:String in _arg_2)
            {
                if (_arg_2[_local_4] == true)
                {
                    _SafeStr_8092 = _local_4;
                };
            };
        }

        public function get platform():String
        {
            return (_SafeStr_8092);
        }

        public function get browser():String
        {
            return (_SafeStr_8093);
        }

        public function get version():String
        {
            return (_version);
        }


    }
}//package com.sulake.core.utils

// _SafeStr_8090 = "_-EJ" (String#7494, DoABC#3)
// _SafeStr_8091 = "_-Y1k" (String#8850, DoABC#3)
// _SafeStr_8092 = "_-yW" (String#10635, DoABC#3)
// _SafeStr_8093 = "_-51b" (String#6888, DoABC#3)


