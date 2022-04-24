// by nota

//com.hurlant.util._SafeStr_1295

package com.hurlant.util
{
    import flash.system.System;

    public class _SafeStr_1295 
    {


        public static function gc():void
        {
            System.pauseForGCIfCollectionImminent();
        }

        public static function get used():uint
        {
            return (System.totalMemory);
        }


    }
}//package com.hurlant.util

// _SafeStr_1295 = "_-aw" (String#9033, DoABC#3)


