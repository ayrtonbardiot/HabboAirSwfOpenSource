// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.motion.Combo

package com.sulake.core.window.motion
{
    import __AS3__.vec.Vector;

    use namespace friend;

    public class Combo extends Motion 
    {

        private var _SafeStr_5637:Vector.<Motion> = new Vector.<Motion>();
        private var _SafeStr_5638:Vector.<Motion> = new Vector.<Motion>();

        public function Combo(... _args)
        {
            for each (var _local_2:Motion in _args)
            {
                _SafeStr_5637.push(_local_2);
            };
            super(((_SafeStr_5637.length > 0) ? _SafeStr_5637[0].target : null));
        }

        override friend function start():void
        {
            super.friend::start();
            for each (var _local_1:Motion in _SafeStr_5637)
            {
                _local_1.friend::start();
            };
        }

        override friend function tick(_arg_1:int):void
        {
            var _local_2:* = null;
            super.friend::tick(_arg_1);
            while ((_local_2 = _SafeStr_5638.pop()) != null)
            {
                _SafeStr_5637.splice(_SafeStr_5638.indexOf(_local_2), 1);
                if (_local_2.running)
                {
                    _local_2.friend::stop();
                };
            };
            for each (_local_2 in _SafeStr_5637)
            {
                if (_local_2.running)
                {
                    _local_2.friend::tick(_arg_1);
                };
                if (_local_2.complete)
                {
                    _SafeStr_5638.push(_local_2);
                };
            };
            if (_SafeStr_5637.length > 0)
            {
                for each (_local_2 in _SafeStr_5637)
                {
                    _SafeStr_4017 = _local_2.target;
                    if (((_SafeStr_4017) && (!(_SafeStr_4017.disposed)))) break;
                };
                _SafeStr_4018 = false;
            }
            else
            {
                _SafeStr_4018 = true;
            };
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_4017 = "_-eB" (String#2049, DoABC#4)
// _SafeStr_4018 = "_-2S" (String#2675, DoABC#4)
// _SafeStr_5637 = "_-m15" (String#6666, DoABC#4)
// _SafeStr_5638 = "_-81j" (String#12206, DoABC#4)


