// by nota

//com.sulake.habbo.tracking.LatencyTracker

package com.sulake.habbo.tracking
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.utils._SafeStr_24;
    import flash.utils.getTimer;
    import _-qv._SafeStr_426;
    import _-I1L._SafeStr_1225;
    import _-qv._SafeStr_473;
    import _-b1B._SafeStr_834;

    public class LatencyTracker implements _SafeStr_13 
    {

        private var _SafeStr_3734:Boolean = false;
        private var _SafeStr_4489:int = 0;
        private var _SafeStr_4488:int = 0;
        private var _SafeStr_4491:int = 0;
        private var _SafeStr_4493:int = 0;
        private var _lastTestTime:int = 0;
        private var _SafeStr_4492:int = 0;
        private var _SafeStr_4490:Array;
        private var _SafeStr_4487:_SafeStr_24;
        private var _habboTracking:HabboTracking;

        public function LatencyTracker(_arg_1:HabboTracking)
        {
            _habboTracking = _arg_1;
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_3734 = false;
            if (_SafeStr_4487 != null)
            {
                _SafeStr_4487.dispose();
                _SafeStr_4487 = null;
            };
            _SafeStr_4490 = null;
            _habboTracking = null;
        }

        public function init():void
        {
            _SafeStr_4488 = _habboTracking.getInteger("latencytest.interval", 20000);
            _SafeStr_4491 = _habboTracking.getInteger("latencytest.report.index", 100);
            _SafeStr_4493 = _habboTracking.getInteger("latencytest.report.delta", 3);
            if (_SafeStr_4488 < 1)
            {
                return;
            };
            _SafeStr_4487 = new _SafeStr_24();
            _SafeStr_4490 = [];
            _SafeStr_3734 = true;
        }

        public function update(_arg_1:uint, _arg_2:int):void
        {
            if (!_SafeStr_3734)
            {
                return;
            };
            if ((_arg_2 - _lastTestTime) > _SafeStr_4488)
            {
                testLatency();
            };
        }

        private function testLatency():void
        {
            _lastTestTime = getTimer();
            _SafeStr_4487.add(_SafeStr_4489, _lastTestTime);
            _habboTracking.send(new _SafeStr_426(_SafeStr_4489));
            _SafeStr_4489++;
        }

        public function onPingResponse(_arg_1:_SafeStr_834):void
        {
            var _local_7:int;
            var _local_2:int;
            var _local_10:int;
            var _local_8:int;
            var _local_5:int;
            var _local_3:int;
            var _local_11:* = null;
            if (((_SafeStr_4487 == null) || (_SafeStr_4490 == null)))
            {
                return;
            };
            var _local_4:_SafeStr_1225 = _arg_1.getParser();
            var _local_9:int = _SafeStr_4487.getValue(_local_4.requestId);
            _SafeStr_4487.remove(_local_4.requestId);
            var _local_6:int = (getTimer() - _local_9);
            _SafeStr_4490.push(_local_6);
            if (((_SafeStr_4490.length == _SafeStr_4491) && (_SafeStr_4491 > 0)))
            {
                _local_7 = 0;
                _local_2 = 0;
                _local_10 = 0;
                _local_8 = 0;
                while (_local_8 < _SafeStr_4490.length)
                {
                    _local_7 = (_local_7 + _SafeStr_4490[_local_8]);
                    _local_8++;
                };
                _local_5 = int((_local_7 / _SafeStr_4490.length));
                _local_8 = 0;
                while (_local_8 < _SafeStr_4490.length)
                {
                    if (_SafeStr_4490[_local_8] < (_local_5 * 2))
                    {
                        _local_2 = (_local_2 + _SafeStr_4490[_local_8]);
                        _local_10++;
                    };
                    _local_8++;
                };
                if (_local_10 == 0)
                {
                    _SafeStr_4490 = [];
                    return;
                };
                _local_3 = int((_local_2 / _local_10));
                if (((Math.abs((_local_5 - _SafeStr_4492)) > _SafeStr_4493) || (_SafeStr_4492 == 0)))
                {
                    _SafeStr_4492 = _local_5;
                    _local_11 = new _SafeStr_473(_local_5, _local_3, _SafeStr_4490.length);
                    _habboTracking.send(_local_11);
                };
                _SafeStr_4490 = [];
            };
        }

        public function get disposed():Boolean
        {
            return (_habboTracking == null);
        }


    }
}//package com.sulake.habbo.tracking

// _SafeStr_1225 = "_-M1z" (String#38605, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_426 = "_-U1V" (String#30952, DoABC#4)
// _SafeStr_4487 = "_-o1I" (String#6686, DoABC#4)
// _SafeStr_4488 = "_-Z1V" (String#15444, DoABC#4)
// _SafeStr_4489 = "_-Ks" (String#13513, DoABC#4)
// _SafeStr_4490 = "_-E1c" (String#3965, DoABC#4)
// _SafeStr_4491 = "_-k1V" (String#15401, DoABC#4)
// _SafeStr_4492 = "_-D1x" (String#15764, DoABC#4)
// _SafeStr_4493 = "_-H1M" (String#22443, DoABC#4)
// _SafeStr_473 = "_-F1E" (String#27940, DoABC#4)
// _SafeStr_834 = "_-l14" (String#21611, DoABC#4)


