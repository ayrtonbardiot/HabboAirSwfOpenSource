// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.JumpBy

package com.sulake.core.window.motion
{
    import com.sulake.core.window._SafeStr_3109;

    use namespace friend;

    public class JumpBy extends Interval 
    {

        protected var _SafeStr_5811:int;
        protected var _SafeStr_5813:int;
        protected var _SafeStr_5812:Number;
        protected var _SafeStr_5815:Number;
        protected var _SafeStr_4234:Number;
        protected var _SafeStr_5814:int;

        public function JumpBy(_arg_1:_SafeStr_3109, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            super(_arg_1, _arg_2);
            _SafeStr_5812 = _arg_3;
            _SafeStr_5815 = _arg_4;
            _SafeStr_4234 = -(_arg_5);
            _SafeStr_5814 = _arg_6;
        }

        override friend function start():void
        {
            super.friend::start();
            _SafeStr_5811 = target.x;
            _SafeStr_5813 = target.y;
        }

        override friend function update(_arg_1:Number):void
        {
            super.friend::update(_arg_1);
            target.x = (_SafeStr_5811 + (_SafeStr_5812 * _arg_1));
            target.y = ((_SafeStr_5813 + (_SafeStr_4234 * Math.abs(Math.sin(((_arg_1 * 3.14159265358979) * _SafeStr_5814))))) + (_SafeStr_5815 * _arg_1));
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_5811 = "_-YO" (String#4024, DoABC#4)
// _SafeStr_5812 = "_-Q1L" (String#4852, DoABC#4)
// _SafeStr_5813 = "_-OD" (String#4044, DoABC#4)
// _SafeStr_5814 = "_-12U" (String#20703, DoABC#4)
// _SafeStr_5815 = "_-4a" (String#4718, DoABC#4)


