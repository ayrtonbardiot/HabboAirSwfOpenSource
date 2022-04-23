// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core._SafeStr_79

package com.sulake.core
{
    import com.sulake.core.runtime._SafeStr_35;
    import com.sulake.core.runtime._SafeStr_800;
    import com.sulake.core.runtime._SafeStr_490;
    import flash.display.DisplayObjectContainer;
    import com.sulake.core.runtime._SafeStr_489;
    import flash.utils.Dictionary;
    import flash.external.ExternalInterface;

    [SecureSWF(rename="true")]
    public final class _SafeStr_79 
    {

        public static const CORE_SETUP_FRAME_UPDATE_SIMPLE:uint = 0;
        public static const CORE_SETUP_FRAME_UPDATE_COMPLEX:uint = 1;
        public static const CORE_SETUP_FRAME_UPDATE_PROFILER:uint = 2;
        public static const CORE_SETUP_FRAME_UPDATE_EXPERIMENT:uint = 4;
        public static const CORE_SETUP_FRAME_UPDATE_MASK:uint = 15;
        public static const CORE_SETUP_DEBUG:uint = 15;
        public static const ERROR_CATEGORY_DOWNLOAD_CONFIGURATION:int = 1;
        public static const ERROR_CATEGORY_DOWNLOAD_LIBRARY:int = 2;
        public static const ERROR_CATEGORY_DOWNLOAD_CRITICAL_ASSET:int = 3;
        public static const ERROR_CATEGORY_PREPARE_COMPONENT:int = 4;
        public static const ERROR_CATEGORY_COMPONENT_RESOURCE_LOAD_ERROR:int = 5;
        public static const ERROR_CATEGORY_INTERFACE_AVAILABILITY:int = 6;
        public static const ERROR_CATEGORY_PRODUCT_DATA:int = 7;
        public static const ERROR_CATEGORY_DOWNLOAD_LOCALIZATION:int = 8;
        public static const ERROR_CATEGORY_FINALIZE_PRELOADING:int = 9;
        public static const ERROR_CATEGORY_INITIALIZE_CORE:int = 10;
        public static const ERROR_CATEGORY_DOWNLOAD_FONT:int = 11;
        public static const ERROR_CATEGORY_FURNIDATA_DOWNLOAD:int = 12;
        public static const ERROR_CATEGORY_DOWNLOAD_EXTERNAL_VARIABLES:int = 20;
        public static const ERROR_CATEGORY_DOWNLOAD_EXTERNAL_VARIABLES_OVERRIDE:int = 21;
        public static const ERROR_CATEGORY_COMMMUNICATION_INIT:int = 29;
        public static const ERROR_CATEGORY_CONNECT_TO_PROXY:int = 30;
        public static const ERROR_UNCAUGHT_ERROR:int = 40;
        public static const ERROR_CATEGORY_INTENTIONAL_DEBUG_CRASH:int = 99;

        private static var _SafeStr_3793:_SafeStr_35;


        public static function get version():String
        {
            return ("0.0.3");
        }

        public static function get instance():_SafeStr_35
        {
            return (_SafeStr_3793);
        }

        public static function instantiate(_arg_1:DisplayObjectContainer, _arg_2:uint, _arg_3:_SafeStr_489=null, _arg_4:Dictionary=null):_SafeStr_35
        {
            if (_SafeStr_3793 == null)
            {
                _SafeStr_3793 = new _SafeStr_800(_arg_1, ((_arg_3 != null) ? _arg_3 : new _SafeStr_490()), _arg_2, _arg_4);
            };
            return (_SafeStr_3793);
        }

        public static function error(_arg_1:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
        {
            if (_SafeStr_3793)
            {
                _SafeStr_3793.error(_arg_1, _arg_2, _arg_3, _arg_4);
            };
        }

        public static function warning(_arg_1:String):void
        {
            if (_SafeStr_3793)
            {
                _SafeStr_3793.warning(_arg_1);
            };
            if (ExternalInterface.available)
            {
                ExternalInterface.call("FlashExternalInterface.logWarn", _arg_1);
            };
        }

        public static function debug(_arg_1:String):void
        {
            if (_SafeStr_3793)
            {
                _SafeStr_3793.debug(_arg_1);
            };
            if (ExternalInterface.available)
            {
                ExternalInterface.call("FlashExternalInterface.logDebug", _arg_1);
            };
        }

        public static function crash(_arg_1:String, _arg_2:int, _arg_3:Error=null):void
        {
            if (_SafeStr_3793)
            {
                _SafeStr_3793.error(_arg_1, true, _arg_2, _arg_3);
            };
        }

        public static function purge():void
        {
            if (_SafeStr_3793)
            {
                _SafeStr_3793.purge();
            };
        }

        public static function dispose():void
        {
            if (_SafeStr_3793 != null)
            {
                _SafeStr_3793.dispose();
                _SafeStr_3793 = null;
            };
        }


    }
}//package com.sulake.core

// _SafeStr_35 = "_-wP" (String#10480, DoABC#3)
// _SafeStr_3793 = "_-z1c" (String#10667, DoABC#3)
// _SafeStr_489 = "_-nI" (String#9899, DoABC#3)
// _SafeStr_490 = "_-G1a" (String#7599, DoABC#3)
// _SafeStr_79 = "_-411" (String#6798, DoABC#3)
// _SafeStr_800 = "_-t11" (String#10239, DoABC#3)


