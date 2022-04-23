// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.MoveBy

package com.sulake.core.window.motion
{
    import com.sulake.core.window._SafeStr_3109;

    use namespace friend;

    public class MoveBy extends MoveTo 
    {

        public function MoveBy(_arg_1:_SafeStr_3109, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        override friend function start():void
        {
            _SafeStr_5962 = (target.x + _SafeStr_5962);
            _SafeStr_5963 = (target.y + _SafeStr_5963);
            super.friend::start();
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_5962 = "_-ay" (String#11045, DoABC#4)
// _SafeStr_5963 = "_-E1i" (String#11378, DoABC#4)


