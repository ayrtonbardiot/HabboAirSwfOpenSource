// by nota

//com.sulake.core.window.motion._SafeStr_3336

package com.sulake.core.window.motion
{
    import __AS3__.vec.Vector;
    import flash.utils.Timer;
    import com.sulake.core._SafeStr_79;
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.getTimer;
    import flash.events.TimerEvent;

    use namespace friend;

    public class _SafeStr_3336 
    {

        private static const _SafeStr_6027:Vector.<Motion> = new Vector.<Motion>();
        private static const _SafeStr_6026:Vector.<Motion> = new Vector.<Motion>();
        private static const _SafeStr_6028:Vector.<Motion> = new Vector.<Motion>();
        private static const _TIMER:Timer = new Timer((1000 / _SafeStr_79.instance.displayObjectContainer.stage.frameRate), 0);

        private static var _IS_UPDATING:Boolean;


        public static function runMotion(_arg_1:Motion):Motion
        {
            if (((_SafeStr_6026.indexOf(_arg_1) == -1) && (_SafeStr_6027.indexOf(_arg_1) == -1)))
            {
                if (_IS_UPDATING)
                {
                    _SafeStr_6027.push(_arg_1);
                }
                else
                {
                    _SafeStr_6026.push(_arg_1);
                    _arg_1.friend::start();
                };
                startTimer();
            };
            return (_arg_1);
        }

        public static function removeMotion(_arg_1:Motion):void
        {
            var _local_2:int = _SafeStr_6026.indexOf(_arg_1);
            if (_local_2 > -1)
            {
                if (_IS_UPDATING)
                {
                    _local_2 = _SafeStr_6028.indexOf(_arg_1);
                    if (_local_2 == -1)
                    {
                        _SafeStr_6028.push(_arg_1);
                    };
                }
                else
                {
                    _SafeStr_6026.splice(_local_2, 1);
                    if (_arg_1.running)
                    {
                        _arg_1.friend::stop();
                    };
                    if (_SafeStr_6026.length == 0)
                    {
                        stopTimer();
                    };
                };
            }
            else
            {
                _local_2 = _SafeStr_6027.indexOf(_arg_1);
                if (_local_2 > -1)
                {
                    _SafeStr_6027.splice(_local_2, 1);
                };
            };
        }

        public static function getMotionByTag(_arg_1:String):Motion
        {
            var _local_2:* = null;
            for each (_local_2 in _SafeStr_6026)
            {
                if (_local_2.tag == _arg_1)
                {
                    return (_local_2);
                };
            };
            for each (_local_2 in _SafeStr_6027)
            {
                if (_local_2.tag == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public static function getMotionByTarget(_arg_1:_SafeStr_3109):Motion
        {
            var _local_2:* = null;
            for each (_local_2 in _SafeStr_6026)
            {
                if (_local_2.target == _arg_1)
                {
                    return (_local_2);
                };
            };
            for each (_local_2 in _SafeStr_6027)
            {
                if (_local_2.target == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public static function getMotionByTagAndTarget(_arg_1:String, _arg_2:_SafeStr_3109):Motion
        {
            var _local_3:* = null;
            for each (_local_3 in _SafeStr_6026)
            {
                if (((_local_3.tag == _arg_1) && (_local_3.target == _arg_2)))
                {
                    return (_local_3);
                };
            };
            for each (_local_3 in _SafeStr_6027)
            {
                if (((_local_3.tag == _arg_1) && (_local_3.target == _arg_2)))
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        public static function get isRunning():Boolean
        {
            return ((_TIMER) ? _TIMER.running : false);
        }

        public static function get isUpdating():Boolean
        {
            return (_IS_UPDATING);
        }

        private static function onTick(_arg_1:TimerEvent):void
        {
            var _local_2:* = null;
            _IS_UPDATING = true;
            var _local_3:int = getTimer();
            while ((_local_2 = _SafeStr_6027.pop()) != null)
            {
                _SafeStr_6026.push(_local_2);
            };
            while ((_local_2 = _SafeStr_6028.pop()) != null)
            {
                _SafeStr_6026.splice(_SafeStr_6026.indexOf(_local_2), 1);
                if (_local_2.running)
                {
                    _local_2.friend::stop();
                };
            };
            for each (_local_2 in _SafeStr_6026)
            {
                if (_local_2.running)
                {
                    _local_2.friend::tick(_local_3);
                    if (_local_2.complete)
                    {
                        removeMotion(_local_2);
                    };
                }
                else
                {
                    removeMotion(_local_2);
                };
            };
            if (_SafeStr_6026.length == 0)
            {
                stopTimer();
            };
            _IS_UPDATING = false;
        }

        private static function startTimer():void
        {
            if (!_TIMER.running)
            {
                _TIMER.addEventListener("timer", onTick);
                _TIMER.start();
            };
        }

        private static function stopTimer():void
        {
            if (_TIMER.running)
            {
                _TIMER.removeEventListener("timer", onTick);
                _TIMER.stop();
            };
        }


        public function getNumRunningMotions(_arg_1:_SafeStr_3109):int
        {
            var _local_2:int;
            for each (var _local_3:Motion in _SafeStr_6026)
            {
                if (_local_3.target == _arg_1)
                {
                    _local_2++;
                };
            };
            return (_local_2);
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3336 = "_-TU" (String#3431, DoABC#4)
// _SafeStr_6026 = "_-95" (String#4494, DoABC#4)
// _SafeStr_6027 = "_-x1U" (String#6541, DoABC#4)
// _SafeStr_6028 = "_-Hr" (String#13713, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)


