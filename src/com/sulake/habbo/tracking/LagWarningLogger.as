// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.tracking.LagWarningLogger

package com.sulake.habbo.tracking
{
    import _-qv._SafeStr_247;

    public class LagWarningLogger 
    {

        private var _SafeStr_4904:int;
        private var _SafeStr_4903:int;
        private var _habboTracking:HabboTracking;

        public function LagWarningLogger(_arg_1:HabboTracking)
        {
            _habboTracking = _arg_1;
        }

        public function chatLagDetected(_arg_1:int):void
        {
            if (((!(enabled)) || (warningInterval <= 0)))
            {
                return;
            };
            _SafeStr_4903++;
            reportWarningsAsNeeded(_arg_1);
        }

        public function update(_arg_1:int):void
        {
            reportWarningsAsNeeded(_arg_1);
        }

        private function reportWarningsAsNeeded(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_SafeStr_4903 == 0)
            {
                return;
            };
            if (((_SafeStr_4904 == 0) || ((_arg_1 - _SafeStr_4904) > warningInterval)))
            {
                _local_2 = new _SafeStr_247(_SafeStr_4903);
                _habboTracking.send(_local_2);
                _SafeStr_4904 = _arg_1;
                _SafeStr_4903 = 0;
            };
        }

        private function get enabled():Boolean
        {
            return (_habboTracking.getBoolean("lagWarningLog.enabled"));
        }

        private function get warningInterval():int
        {
            return (_habboTracking.getInteger("lagWarningLog.interval.seconds", 10) * 1000);
        }


    }
}//package com.sulake.habbo.tracking

// _SafeStr_247 = "_-SF" (String#23172, DoABC#4)
// _SafeStr_4903 = "_-N19" (String#9703, DoABC#4)
// _SafeStr_4904 = "_-bo" (String#14672, DoABC#4)


