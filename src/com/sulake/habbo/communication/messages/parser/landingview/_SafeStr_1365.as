// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.landingview._SafeStr_1365

package com.sulake.habbo.communication.messages.parser.landingview
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Eh._SafeStr_1631;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1365 implements IMessageParser 
    {

        private var _SafeStr_6934:Array;


        public function get articles():Array
        {
            return (_SafeStr_6934);
        }

        public function flush():Boolean
        {
            _SafeStr_6934 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_6934.push(new _SafeStr_1631(_arg_1));
                _local_3++;
            };
            return (true);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.landingview

// _SafeStr_1365 = "_-32G" (String#6742, DoABC#3)
// _SafeStr_1631 = "_-91" (String#7149, DoABC#3)
// _SafeStr_6934 = "_-b1I" (String#9046, DoABC#3)


