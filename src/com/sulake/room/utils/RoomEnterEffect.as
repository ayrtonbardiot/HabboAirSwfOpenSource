// by nota

//com.sulake.room.utils.RoomEnterEffect

package com.sulake.room.utils
{
    import flash.utils.getTimer;

    public class RoomEnterEffect 
    {

        public static const STATE_NOT_INITIALIZED:int = 0;
        public static const STATE_START_DELAY:int = 1;
        public static const STATE_RUNNING:int = 2;
        public static const STATE_OVER:int = 3;

        private static var _SafeStr_3734:int = 0;
        private static var _SafeStr_4310:Boolean = false;
        private static var _SafeStr_4311:Number;
        private static var _SafeStr_4307:int = 0;
        private static var _SafeStr_4308:int = 20000;
        private static var _SafeStr_4309:int = 2000;


        public static function init(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_4311 = 0;
            _SafeStr_4308 = _arg_1;
            _SafeStr_4309 = _arg_2;
            _SafeStr_4307 = getTimer();
            _SafeStr_3734 = 1;
        }

        public static function turnVisualizationOn():void
        {
            if (((_SafeStr_3734 == 0) || (_SafeStr_3734 == 3)))
            {
                return;
            };
            var _local_1:int = (getTimer() - _SafeStr_4307);
            if (_local_1 > (_SafeStr_4308 + _SafeStr_4309))
            {
                _SafeStr_3734 = 3;
                return;
            };
            _SafeStr_4310 = true;
            if (_local_1 < _SafeStr_4308)
            {
                _SafeStr_3734 = 1;
                return;
            };
            _SafeStr_3734 = 2;
            _SafeStr_4311 = ((_local_1 - _SafeStr_4308) / _SafeStr_4309);
        }

        public static function turnVisualizationOff():void
        {
            _SafeStr_4310 = false;
        }

        public static function isVisualizationOn():Boolean
        {
            return ((_SafeStr_4310) && (isRunning()));
        }

        public static function isRunning():Boolean
        {
            if (((_SafeStr_3734 == 1) || (_SafeStr_3734 == 2)))
            {
                return (true);
            };
            return (false);
        }

        public static function getDelta(_arg_1:Number=0, _arg_2:Number=1):Number
        {
            return (Math.min(Math.max(_SafeStr_4311, _arg_1), _arg_2));
        }

        public static function get totalRunningTime():int
        {
            return (_SafeStr_4308 + _SafeStr_4309);
        }


    }
}//package com.sulake.room.utils

// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_4307 = "_-s1Y" (String#6524, DoABC#4)
// _SafeStr_4308 = "_-l16" (String#4097, DoABC#4)
// _SafeStr_4309 = "_-D14" (String#4346, DoABC#4)
// _SafeStr_4310 = "_-xm" (String#4326, DoABC#4)
// _SafeStr_4311 = "_-e1x" (String#4647, DoABC#4)


