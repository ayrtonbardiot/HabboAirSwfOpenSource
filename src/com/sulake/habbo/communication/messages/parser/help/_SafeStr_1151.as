// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1151

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1151 implements IMessageParser 
    {

        private var _SafeStr_8440:Array = [];


        public function get callArray():Array
        {
            return (_SafeStr_8440);
        }

        public function get callCount():int
        {
            return (_SafeStr_8440.length);
        }

        public function flush():Boolean
        {
            _SafeStr_8440 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_2:* = null;
            _SafeStr_8440 = [];
            var _local_3:int = _arg_1.readInteger();
            while (_local_4 < _local_3)
            {
                _local_2 = {};
                _local_2.callId = _arg_1.readString();
                _local_2.timeStamp = _arg_1.readString();
                _local_2.message = _arg_1.readString();
                _SafeStr_8440.push(_local_2);
                _local_4++;
            };
            return (true);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1151 = "_-c1r" (String#9126, DoABC#3)
// _SafeStr_8440 = "_-vx" (String#10432, DoABC#3)


