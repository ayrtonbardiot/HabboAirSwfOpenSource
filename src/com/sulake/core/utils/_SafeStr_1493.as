// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.utils._SafeStr_1493

package com.sulake.core.utils
{
    import flash.utils.setTimeout;
    import flash.system.System;
    import flash.utils.getTimer;
    import com.sulake.core._SafeStr_79;

    public class _SafeStr_1493 
    {

        private static var _SafeStr_8072:uint = 300;
        private static var _SafeStr_8073:uint = 400;
        private static var _SafeStr_8074:uint = 60000;
        private static var _SafeStr_4016:Boolean = false;


        public static function get softPurgeTriggerMegaBytes():uint
        {
            return (_SafeStr_8072);
        }

        public static function set softPurgeTriggerMegaBytes(_arg_1:uint):void
        {
            _SafeStr_8072 = _arg_1;
        }

        public static function get hardPurgeTriggerMegaBytes():uint
        {
            return (_SafeStr_8073);
        }

        public static function set hardPurgeTriggerMegaBytes(_arg_1:uint):void
        {
            _SafeStr_8073 = Math.max(_arg_1, _SafeStr_8072);
        }

        public static function get frequencyMilliSeconds():uint
        {
            return (_SafeStr_8074);
        }

        public static function set frequencyMilliSeconds(_arg_1:uint):void
        {
            _SafeStr_8074 = _arg_1;
        }

        public static function get isRunning():Boolean
        {
            return (_SafeStr_4016);
        }

        protected static function get isMemoryDataAvailable():Boolean
        {
            return ((_SafeStr_1587.majorVersion > 10) || ((_SafeStr_1587.majorVersion == 10) && (_SafeStr_1587.majorRevision >= 1)));
        }

        public static function start():void
        {
            if (!_SafeStr_4016)
            {
                if (!isMemoryDataAvailable)
                {
                    _SafeStr_8074 = (_SafeStr_8074 * 2);
                    _SafeStr_8072 = 0;
                    _SafeStr_8073 = 2147483647;
                };
                (setTimeout(onInterval, _SafeStr_8074));
                _SafeStr_4016 = true;
            };
        }

        public static function stop():void
        {
            if (_SafeStr_4016)
            {
                _SafeStr_4016 = false;
            };
        }

        public static function trigger():void
        {
            var _local_2:int;
            var _local_3:Number;
            var _local_1:Object = System;
            var _local_4:Number = ((isMemoryDataAvailable) ? (((_local_1.totalMemory - _local_1.freeMemory) / 0x0400) / 0x0400) : (softPurgeTriggerMegaBytes + 1));
            if (_local_4 > softPurgeTriggerMegaBytes)
            {
                _local_2 = getTimer();
                _SafeStr_79.purge();
                _local_3 = ((isMemoryDataAvailable) ? (((_local_1.totalMemory - _local_1.freeMemory) / 0x0400) / 0x0400) : 0);
                if (_local_3 > _SafeStr_8073)
                {
                    triggerGC();
                };
            };
        }

        public static function triggerGC():void
        {
            System.pauseForGCIfCollectionImminent(0.25);
        }

        private static function onInterval():void
        {
            if (_SafeStr_4016)
            {
                trigger();
                (setTimeout(onInterval, _SafeStr_8074));
            };
        }


    }
}//package com.sulake.core.utils

// _SafeStr_1493 = "_-K3" (String#7903, DoABC#3)
// _SafeStr_1587 = "_-Qi" (String#8330, DoABC#3)
// _SafeStr_4016 = "_-z1x" (String#10677, DoABC#3)
// _SafeStr_79 = "_-411" (String#6798, DoABC#3)
// _SafeStr_8072 = "_-V1H" (String#8608, DoABC#3)
// _SafeStr_8073 = "_-B10" (String#7301, DoABC#3)
// _SafeStr_8074 = "_-j1X" (String#9603, DoABC#3)


