// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.tracking.FramerateTracker

package com.sulake.habbo.tracking
{
    public class FramerateTracker 
    {

        private var _SafeStr_4108:int;
        private var _SafeStr_4107:int;
        private var _SafeStr_4106:Number;
        private var _SafeStr_4109:int;
        private var _habboTracking:HabboTracking;

        public function FramerateTracker(_arg_1:HabboTracking)
        {
            _habboTracking = _arg_1;
        }

        public function get frameRate():int
        {
            return (Math.round((1000 / _SafeStr_4106)));
        }

        public function trackUpdate(_arg_1:uint, _arg_2:int):void
        {
            var _local_3:Number;
            _SafeStr_4107++;
            if (_SafeStr_4107 == 1)
            {
                _SafeStr_4106 = _arg_1;
                _SafeStr_4108 = _arg_2;
            }
            else
            {
                _local_3 = _SafeStr_4107;
                _SafeStr_4106 = (((_SafeStr_4106 * (_local_3 - 1)) / _local_3) + (_arg_1 / _local_3));
            };
            if ((_arg_2 - _SafeStr_4108) >= (_habboTracking.getInteger("tracking.framerate.reportInterval.seconds", 300) * 1000))
            {
                _SafeStr_4107 = 0;
                if (_SafeStr_4109 < _habboTracking.getInteger("tracking.framerate.maximumEvents", 5))
                {
                    _habboTracking.trackGoogle("performance", "averageFramerate", frameRate);
                    _SafeStr_4109++;
                    _SafeStr_4108 = _arg_2;
                };
            };
        }


    }
}//package com.sulake.habbo.tracking

// _SafeStr_4106 = "_-f1f" (String#2949, DoABC#4)
// _SafeStr_4107 = "_-7z" (String#4304, DoABC#4)
// _SafeStr_4108 = "_-519" (String#6430, DoABC#4)
// _SafeStr_4109 = "_-818" (String#13843, DoABC#4)


