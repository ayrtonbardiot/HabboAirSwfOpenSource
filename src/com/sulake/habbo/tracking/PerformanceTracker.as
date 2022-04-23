// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.tracking.PerformanceTracker

package com.sulake.habbo.tracking
{
    import com.sulake.core.utils.debug.GarbageMonitor;
    import flash.system.Capabilities;
    import flash.external.ExternalInterface;
    import flash.utils.getTimer;
    import flash.system.System;
    import _-qv._SafeStr_203;

    public class PerformanceTracker 
    {

        private var _SafeStr_4002:int = 0;
        private var _SafeStr_4106:Number = 0;
        private var _SafeStr_5289:String = "";
        private var _flashVersion:String = "";
        private var _SafeStr_5295:String = "";
        private var _SafeStr_5296:String = "";
        private var _SafeStr_5297:Boolean = false;
        private var _SafeStr_5290:GarbageMonitor = null;
        private var _SafeStr_5291:int = 0;
        private var _SafeStr_5292:int = 0;
        private var _SafeStr_4108:int = 0;
        private var _SafeStr_5293:int = 0;
        private var _SafeStr_5294:Number = 0;
        private var _habboTracking:HabboTracking;

        public function PerformanceTracker(_arg_1:HabboTracking)
        {
            _habboTracking = _arg_1;
            _flashVersion = Capabilities.version;
            _SafeStr_5295 = Capabilities.os;
            _SafeStr_5297 = Capabilities.isDebugger;
            try
            {
                _SafeStr_5289 = ((ExternalInterface.available) ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown");
            }
            catch(e:Error)
            {
            };
            if (_SafeStr_5289 == null)
            {
                _SafeStr_5289 = "unknown";
            };
            _SafeStr_5290 = new GarbageMonitor();
            updateGarbageMonitor();
            _SafeStr_4108 = getTimer();
        }

        private static function differenceInPercents(_arg_1:Number, _arg_2:Number):Number
        {
            if (_arg_1 == _arg_2)
            {
                return (0);
            };
            var _local_4:* = _arg_1;
            var _local_3:* = _arg_2;
            if (_arg_2 > _arg_1)
            {
                _local_4 = _arg_2;
                _local_3 = _arg_1;
            };
            return (100 * (1 - (_local_3 / _local_4)));
        }


        public function get flashVersion():String
        {
            return (_flashVersion);
        }

        public function get averageUpdateInterval():int
        {
            return (_SafeStr_4106);
        }

        private function updateGarbageMonitor():Object
        {
            var _local_2:* = null;
            var _local_1:Array = _SafeStr_5290.list;
            if (((_local_1 == null) || (_local_1.length == 0)))
            {
                _local_2 = new GarbageTester("tester");
                _SafeStr_5290.insert(_local_2, "tester");
                return (_local_2);
            };
            return (null);
        }

        public function update(_arg_1:uint, _arg_2:int):void
        {
            var _local_7:* = null;
            var _local_3:Number;
            var _local_4:uint;
            var _local_6:Boolean;
            var _local_5:Number;
            if (isGarbageMonitored)
            {
                _local_7 = updateGarbageMonitor();
                if (_local_7 != null)
                {
                    _SafeStr_5291++;
                    _SafeStr_14.log("Garbage collection");
                };
            };
            var _local_8:Boolean;
            if (_arg_1 > slowUpdateLimit)
            {
                _SafeStr_5292++;
                _local_8 = true;
            }
            else
            {
                _SafeStr_4002++;
                if (_SafeStr_4002 <= 1)
                {
                    _SafeStr_4106 = _arg_1;
                }
                else
                {
                    _local_3 = _SafeStr_4002;
                    _SafeStr_4106 = (((_SafeStr_4106 * (_local_3 - 1)) / _local_3) + (_arg_1 / _local_3));
                };
            };
            if ((((_arg_2 - _SafeStr_4108) > (reportInterval * 1000)) && (_SafeStr_5293 < reportLimit)))
            {
                _local_4 = System.totalMemory;
                _SafeStr_14.log((((("*** Performance tracker: average frame rate " + (1000 / _SafeStr_4106)) + "/s, system memory usage : ") + _local_4) + " bytes"));
                _local_6 = true;
                if (((useDistribution) && (_SafeStr_5293 > 0)))
                {
                    _local_5 = differenceInPercents(_SafeStr_5294, _SafeStr_4106);
                    if (_local_5 < meanDevianceLimit)
                    {
                        _local_6 = false;
                    };
                };
                _SafeStr_4108 = _arg_2;
                if (((_local_6) || (_local_8)))
                {
                    _SafeStr_5294 = _SafeStr_4106;
                    sendReport(_arg_2);
                    _SafeStr_5293++;
                };
            };
        }

        private function sendReport(_arg_1:int):void
        {
            var _local_4:int = int((_arg_1 / 1000));
            var _local_3:int = -1;
            var _local_2:int = int((System.totalMemory / 0x0400));
            _habboTracking.send(new _SafeStr_203(_local_4, _SafeStr_5289, _flashVersion, _SafeStr_5295, _SafeStr_5296, _SafeStr_5297, _local_2, _local_3, _SafeStr_5291, _SafeStr_4106, _SafeStr_5292));
            _SafeStr_5291 = 0;
            _SafeStr_4106 = 0;
            _SafeStr_4002 = 0;
            _SafeStr_5292 = 0;
        }

        private function get isGarbageMonitored():Boolean
        {
            return (_habboTracking.getBoolean("monitor.garbage.collection"));
        }

        private function get slowUpdateLimit():int
        {
            return (_habboTracking.getInteger("performancetest.slowupdatelimit", 1000));
        }

        private function get reportInterval():int
        {
            return (_habboTracking.getInteger("performancetest.interval", 60));
        }

        private function get reportLimit():int
        {
            return (_habboTracking.getInteger("performancetest.reportlimit", 10));
        }

        private function get meanDevianceLimit():Number
        {
            return ((_habboTracking.propertyExists("performancetest.distribution.deviancelimit.percent")) ? _habboTracking.getProperty("performancetest.distribution.deviancelimit.percent") : 10);
        }

        private function get useDistribution():Boolean
        {
            return (_habboTracking.getBoolean("performancetest.distribution.enabled"));
        }


    }
}//package com.sulake.habbo.tracking

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_203 = "_-W17" (String#31553, DoABC#4)
// _SafeStr_4002 = "_-iP" (String#1397, DoABC#4)
// _SafeStr_4106 = "_-f1f" (String#2949, DoABC#4)
// _SafeStr_4108 = "_-519" (String#6430, DoABC#4)
// _SafeStr_5289 = "_-f1T" (String#11205, DoABC#4)
// _SafeStr_5290 = "_-iI" (String#14206, DoABC#4)
// _SafeStr_5291 = "_-g1A" (String#11168, DoABC#4)
// _SafeStr_5292 = "_-Ff" (String#11301, DoABC#4)
// _SafeStr_5293 = "_-oO" (String#11805, DoABC#4)
// _SafeStr_5294 = "_-fZ" (String#19140, DoABC#4)
// _SafeStr_5295 = "_-QE" (String#18749, DoABC#4)
// _SafeStr_5296 = "_-N1" (String#30049, DoABC#4)
// _SafeStr_5297 = "_-212" (String#18349, DoABC#4)


