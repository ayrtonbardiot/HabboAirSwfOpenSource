// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.Callback

package com.sulake.core.window.motion
{
    use namespace friend;

    public class Callback extends Motion 
    {

        protected var _callback:Function;

        public function Callback(_arg_1:Function)
        {
            _callback = _arg_1;
            super(null);
        }

        override public function get running():Boolean
        {
            return ((_SafeStr_4016) && (!(_callback == null)));
        }

        override friend function tick(_arg_1:int):void
        {
            super.friend::tick(_arg_1);
            if (_callback != null)
            {
                (_callback(this));
                _callback = null;
            };
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_4016 = "_-z1x" (String#1885, DoABC#4)


