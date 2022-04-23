// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.Interval

package com.sulake.core.window.motion
{
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.getTimer;

    use namespace friend;

    public class Interval extends Motion 
    {

        private var _SafeStr_5683:int;
        private var _duration:int;

        public function Interval(_arg_1:_SafeStr_3109, _arg_2:int)
        {
            super(_arg_1);
            _SafeStr_4018 = false;
            _duration = _arg_2;
        }

        public function get duration():int
        {
            return (_duration);
        }

        override friend function start():void
        {
            super.friend::start();
            _SafeStr_4018 = false;
            _SafeStr_5683 = getTimer();
        }

        final override friend function tick(_arg_1:int):void
        {
            var _local_2:Number = ((_arg_1 - _SafeStr_5683) / _duration);
            if (_local_2 < 1)
            {
                friend::update(_local_2);
            }
            else
            {
                friend::update(1);
                _SafeStr_4018 = true;
            };
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_4018 = "_-2S" (String#2675, DoABC#4)
// _SafeStr_5683 = "_-Y17" (String#8860, DoABC#4)


