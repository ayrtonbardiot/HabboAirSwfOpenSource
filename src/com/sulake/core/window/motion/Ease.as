// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.Ease

package com.sulake.core.window.motion
{
    use namespace friend;

    public class Ease extends Interval 
    {

        protected var _SafeStr_5724:Interval;

        public function Ease(_arg_1:Interval)
        {
            super(_arg_1.target, _arg_1.duration);
            _SafeStr_5724 = _arg_1;
        }

        override friend function start():void
        {
            super.friend::start();
            _SafeStr_5724.friend::start();
        }

        override friend function update(_arg_1:Number):void
        {
            super.friend::update(_arg_1);
            _SafeStr_5724.friend::update(_arg_1);
        }

        override friend function stop():void
        {
            super.friend::stop();
            _SafeStr_5724.friend::stop();
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_5724 = "_-48" (String#10691, DoABC#4)


