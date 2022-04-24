// by nota

//com.sulake.core.window.services.GestureAgentService

package com.sulake.core.window.services
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class GestureAgentService implements _SafeStr_3431, _SafeStr_13 
    {

        private var _disposed:Boolean = false;
        protected var _SafeStr_6581:Boolean;
        protected var _window:_SafeStr_3109;
        protected var _SafeStr_4582:Timer;
        protected var _SafeStr_6583:uint = 0;
        protected var _callback:Function;
        protected var _SafeStr_5812:int;
        protected var _SafeStr_5815:int;


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            end(_window);
            _disposed = true;
        }

        public function begin(_arg_1:_SafeStr_3109, _arg_2:Function, _arg_3:uint, _arg_4:int, _arg_5:int):_SafeStr_3109
        {
            _SafeStr_6583 = _arg_3;
            var _local_6:_SafeStr_3109 = _window;
            if (_window != null)
            {
                end(_window);
            };
            if (((_arg_1) && (!(_arg_1.disposed))))
            {
                _window = _arg_1;
                _window.addEventListener("WE_DESTROYED", clientWindowDestroyed);
                _callback = _arg_2;
                _SafeStr_6581 = true;
                _SafeStr_5812 = _arg_4;
                _SafeStr_5815 = _arg_5;
                _SafeStr_4582 = new Timer(40, 0);
                _SafeStr_4582.addEventListener("timer", operate);
                _SafeStr_4582.start();
            };
            return (_local_6);
        }

        protected function operate(_arg_1:TimerEvent):void
        {
            _SafeStr_5812 = (_SafeStr_5812 * 0.75);
            _SafeStr_5815 = (_SafeStr_5815 * 0.75);
            if (((Math.abs(_SafeStr_5812) <= 1) && (Math.abs(_SafeStr_5815) <= 1)))
            {
                end(_window);
            }
            else
            {
                if (_callback != null)
                {
                    (_callback(_SafeStr_5812, _SafeStr_5815));
                };
            };
        }

        public function end(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            var _local_2:_SafeStr_3109 = _window;
            if (_SafeStr_4582)
            {
                _SafeStr_4582.stop();
                _SafeStr_4582.removeEventListener("timer", operate);
                _SafeStr_4582 = null;
            };
            if (_SafeStr_6581)
            {
                if (_window == _arg_1)
                {
                    if (!_window.disposed)
                    {
                        _window.removeEventListener("WE_DESTROYED", clientWindowDestroyed);
                    };
                    _window = null;
                    _SafeStr_6581 = false;
                };
            };
            return (_local_2);
        }

        private function clientWindowDestroyed(_arg_1:_SafeStr_3116):void
        {
            end(_window);
        }


    }
}//package com.sulake.core.window.services

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3431 = "_-91F" (String#10782, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5812 = "_-Q1L" (String#4852, DoABC#4)
// _SafeStr_5815 = "_-4a" (String#4718, DoABC#4)
// _SafeStr_6581 = "_-Lx" (String#4675, DoABC#4)
// _SafeStr_6583 = "_-61n" (String#7312, DoABC#4)


