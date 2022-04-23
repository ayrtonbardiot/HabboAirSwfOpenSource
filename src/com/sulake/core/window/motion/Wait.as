// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.Wait

package com.sulake.core.window.motion
{
    import flash.utils.getTimer;

    use namespace friend;

    public class Wait extends Motion 
    {

        private var _SafeStr_5683:int;
        private var _SafeStr_6029:int;

        public function Wait(_arg_1:int)
        {
            super(null);
            _SafeStr_6029 = _arg_1;
        }

        override public function get running():Boolean
        {
            return (_SafeStr_4016);
        }

        override friend function start():void
        {
            super.friend::start();
            _SafeStr_4018 = false;
            _SafeStr_5683 = getTimer();
        }

        override friend function tick(_arg_1:int):void
        {
            _SafeStr_4018 = ((_arg_1 - _SafeStr_5683) >= _SafeStr_6029);
            if (_SafeStr_4018)
            {
                friend::stop();
            };
            super.friend::tick(_arg_1);
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_4016 = "_-z1x" (String#1885, DoABC#4)
// _SafeStr_4018 = "_-2S" (String#2675, DoABC#4)
// _SafeStr_5683 = "_-Y17" (String#8860, DoABC#4)
// _SafeStr_6029 = "_-Oi" (String#18909, DoABC#4)


