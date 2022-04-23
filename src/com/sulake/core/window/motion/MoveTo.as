// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.MoveTo

package com.sulake.core.window.motion
{
    import com.sulake.core.window._SafeStr_3109;

    use namespace friend;

    public class MoveTo extends Interval 
    {

        protected var _SafeStr_5811:Number;
        protected var _SafeStr_5813:Number;
        protected var _SafeStr_5962:Number;
        protected var _SafeStr_5963:Number;
        protected var _SafeStr_5812:Number;
        protected var _SafeStr_5815:Number;

        public function MoveTo(_arg_1:_SafeStr_3109, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            super(_arg_1, _arg_2);
            _SafeStr_5962 = _arg_3;
            _SafeStr_5963 = _arg_4;
        }

        override friend function start():void
        {
            super.friend::start();
            _SafeStr_5811 = target.x;
            _SafeStr_5813 = target.y;
            _SafeStr_5812 = (_SafeStr_5962 - _SafeStr_5811);
            _SafeStr_5815 = (_SafeStr_5963 - _SafeStr_5813);
        }

        override friend function update(_arg_1:Number):void
        {
            target.x = (_SafeStr_5811 + (_SafeStr_5812 * _arg_1));
            target.y = (_SafeStr_5813 + (_SafeStr_5815 * _arg_1));
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_5811 = "_-YO" (String#4024, DoABC#4)
// _SafeStr_5812 = "_-Q1L" (String#4852, DoABC#4)
// _SafeStr_5813 = "_-OD" (String#4044, DoABC#4)
// _SafeStr_5815 = "_-4a" (String#4718, DoABC#4)
// _SafeStr_5962 = "_-ay" (String#11045, DoABC#4)
// _SafeStr_5963 = "_-E1i" (String#11378, DoABC#4)


