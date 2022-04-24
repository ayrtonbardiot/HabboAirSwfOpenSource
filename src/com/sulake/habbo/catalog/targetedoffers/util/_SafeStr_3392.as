// by nota

//com.sulake.habbo.catalog.targetedoffers.util._SafeStr_3392

package com.sulake.habbo.catalog.targetedoffers.util
{
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.localization._SafeStr_18;

    public class _SafeStr_3392 
    {


        public static function getStringFromSeconds(_arg_1:_SafeStr_18, _arg_2:uint):String
        {
            var _local_3:int = int(Math.floor(((_arg_2 / 60) / 60)));
            if (_local_3 > 24)
            {
                return (FriendlyTime.getFriendlyTime(_arg_1, _arg_2, "", 1));
            };
            if (_local_3 > 0)
            {
                return (FriendlyTime.getLocalization(_arg_1, "friendlytime.hours.short", _local_3));
            };
            return (convertSecondsToTime(_arg_2));
        }

        public static function convertSecondsToTime(_arg_1:int):String
        {
            var _local_2:int = int(Math.floor(((_arg_1 / 60) / 60)));
            var _local_4:int = int(Math.floor(((_arg_1 - ((_local_2 * 60) * 60)) / 60)));
            var _local_3:int = ((_arg_1 - ((_local_2 * 60) * 60)) - (_local_4 * 60));
            var _local_5:String = "";
            if (_local_2 > 0)
            {
                _local_5 = (_local_2 + ":");
            };
            _local_5 = ((_local_4 < 10) ? ((_local_5 + "0") + _local_4) : (_local_5 + _local_4));
            if (_local_2 == 0)
            {
                _local_5 = (_local_5 + ":");
                _local_5 = ((_local_3 < 10) ? ((_local_5 + "0") + _local_3) : (_local_5 + _local_3));
            };
            return (_local_5);
        }


    }
}//package com.sulake.habbo.catalog.targetedoffers.util

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_3392 = "_-Ez" (String#22556, DoABC#4)


