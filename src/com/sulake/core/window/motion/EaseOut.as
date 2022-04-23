// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.EaseOut

package com.sulake.core.window.motion
{
    use namespace friend;

    public class EaseOut extends EaseRate 
    {

        public function EaseOut(_arg_1:Interval, _arg_2:Number)
        {
            super(_arg_1, _arg_2);
        }

        override friend function update(_arg_1:Number):void
        {
            _SafeStr_5724.friend::update(Math.pow(_arg_1, (1 / _SafeStr_5725)));
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_5724 = "_-48" (String#10691, DoABC#4)
// _SafeStr_5725 = "_-lo" (String#18183, DoABC#4)


