// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist._SafeStr_3259

package com.sulake.habbo.friendlist
{
    public class _SafeStr_3259 
    {

        public static const _SafeStr_4205:int = 0;
        public static const _SafeStr_8592:int = 1;
        public static const SMILE:int = 2;
        public static const BOBBA:int = 3;
        private static const _asString:Array = ["none", "heart", "smile", "bobba"];


        public static function statusAsString(_arg_1:int):String
        {
            return (_asString[_arg_1]);
        }

        public static function get displayableStatuses():Array
        {
            return ([1, 2, 3]);
        }

        public static function stringAsStatus(_arg_1:String):int
        {
            for each (var _local_2:int in displayableStatuses)
            {
                if (statusAsString(_local_2) == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (0);
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_3259 = "_-CW" (String#5979, DoABC#4)
// _SafeStr_4205 = "_-51E" (String#7514, DoABC#4)
// _SafeStr_8592 = "_-d1W" (String#37254, DoABC#4)


