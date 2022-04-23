// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.DropBounce

package com.sulake.core.window.motion
{
    import com.sulake.core.window._SafeStr_3109;

    use namespace friend;

    public class DropBounce extends Interval 
    {

        private var _SafeStr_4234:int;
        private var _offset:int;

        public function DropBounce(_arg_1:_SafeStr_3109, _arg_2:int, _arg_3:int)
        {
            super(_arg_1, _arg_2);
            _SafeStr_4234 = _arg_3;
        }

        override friend function start():void
        {
            super.friend::start();
            _offset = target.y;
            target.y = (_offset - _SafeStr_4234);
        }

        override friend function update(_arg_1:Number):void
        {
            super.friend::update(_arg_1);
            target.y = ((_offset - _SafeStr_4234) + (getBounceOffset(_arg_1) * _SafeStr_4234));
        }

        protected function getBounceOffset(_arg_1:Number):Number
        {
            if (_arg_1 < 0.364)
            {
                return ((7.5625 * _arg_1) * _arg_1);
            };
            if (_arg_1 < 0.727)
            {
                _arg_1 = (_arg_1 - 0.545);
                return (((7.5625 * _arg_1) * _arg_1) + 0.75);
            };
            if (_arg_1 < 0.909)
            {
                _arg_1 = (_arg_1 - 0.9091);
                return (((7.5625 * _arg_1) * _arg_1) + 0.9375);
            };
            _arg_1 = (_arg_1 - 0.955);
            return (((7.5625 * _arg_1) * _arg_1) + 0.984375);
        }

        override friend function stop():void
        {
            target.y = _offset;
            super.friend::stop();
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)


