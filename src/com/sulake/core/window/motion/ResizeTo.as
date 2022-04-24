// by nota

//com.sulake.core.window.motion.ResizeTo

package com.sulake.core.window.motion
{
    import com.sulake.core.window._SafeStr_3109;

    use namespace friend;

    public class ResizeTo extends Interval 
    {

        protected var _SafeStr_5698:Number;
        protected var _SafeStr_5700:Number;
        protected var _SafeStr_5697:Number;
        protected var _SafeStr_5699:Number;
        protected var _SafeStr_5701:Number;
        protected var _SafeStr_5702:Number;

        public function ResizeTo(_arg_1:_SafeStr_3109, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            super(_arg_1, _arg_2);
            _SafeStr_5697 = _arg_3;
            _SafeStr_5699 = _arg_4;
        }

        override friend function start():void
        {
            super.friend::start();
            _SafeStr_5698 = target.width;
            _SafeStr_5700 = target.height;
            _SafeStr_5701 = (_SafeStr_5697 - _SafeStr_5698);
            _SafeStr_5702 = (_SafeStr_5699 - _SafeStr_5700);
        }

        override friend function update(_arg_1:Number):void
        {
            target.width = (_SafeStr_5698 + (_SafeStr_5701 * _arg_1));
            target.height = (_SafeStr_5700 + (_SafeStr_5702 * _arg_1));
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_5697 = "_-A1d" (String#18389, DoABC#4)
// _SafeStr_5698 = "_-g1c" (String#13858, DoABC#4)
// _SafeStr_5699 = "_-Qw" (String#18621, DoABC#4)
// _SafeStr_5700 = "_-D1y" (String#15428, DoABC#4)
// _SafeStr_5701 = "_-f1v" (String#16219, DoABC#4)
// _SafeStr_5702 = "_-d1T" (String#16226, DoABC#4)


