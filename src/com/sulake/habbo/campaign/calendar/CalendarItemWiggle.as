// by nota

//com.sulake.habbo.campaign.calendar.CalendarItemWiggle

package com.sulake.habbo.campaign.calendar
{
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class CalendarItemWiggle 
    {

        private static const TIMER_INTERVAL:int = 80;
        private static const _SafeStr_8306:int = 10;
        private static const _SafeStr_8307:int = 40;
        private static const _SafeStr_8308:int = 7;

        private var _window:_SafeStr_3109;
        private var _SafeStr_4582:Timer;
        private var _direction:int;
        private var _SafeStr_4002:int;
        private var _SafeStr_6949:int;

        public function CalendarItemWiggle(_arg_1:_SafeStr_3109)
        {
            if (!_arg_1)
            {
                return;
            };
            _window = _arg_1;
            _SafeStr_6949 = _arg_1.y;
            _arg_1.y = (_arg_1.y - 10);
            _direction = 1;
            _SafeStr_4582 = new Timer(80);
            _SafeStr_4582.addEventListener("timer", onTimerEvent);
            _SafeStr_4582.start();
        }

        private function onTimerEvent(_arg_1:TimerEvent):void
        {
            if (!_window)
            {
                dispose();
            };
            var _local_3:Number = (10 * ((7 - _SafeStr_4002) / 7));
            var _local_4:Number = (Math.abs((_window.y - _SafeStr_6949)) / _local_3);
            var _local_2:Number = (Math.max(2, (Math.sin(_local_4) * 40)) * _direction);
            _window.y = (_window.y + _local_2);
            if (_direction > 0)
            {
                if (_window.y > _SafeStr_6949)
                {
                    _direction = (_direction * -1);
                    _window.y = _SafeStr_6949;
                    _SafeStr_4002++;
                };
            }
            else
            {
                if (_window.y <= (_SafeStr_6949 - _local_3))
                {
                    _direction = (_direction * -1);
                    _window.y = (_SafeStr_6949 - _local_3);
                    _SafeStr_4002++;
                };
            };
            if (_SafeStr_4002 >= 7)
            {
                dispose();
            };
        }

        private function dispose():void
        {
            _window.y = _SafeStr_6949;
            _window = null;
            _SafeStr_4582.reset();
            _SafeStr_4582 = null;
        }


    }
}//package com.sulake.habbo.campaign.calendar

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_4002 = "_-iP" (String#1397, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_6949 = "_-OY" (String#7904, DoABC#4)
// _SafeStr_8306 = "_-Rb" (String#39257, DoABC#4)
// _SafeStr_8307 = "_-P14" (String#41314, DoABC#4)
// _SafeStr_8308 = "_-41y" (String#32988, DoABC#4)


