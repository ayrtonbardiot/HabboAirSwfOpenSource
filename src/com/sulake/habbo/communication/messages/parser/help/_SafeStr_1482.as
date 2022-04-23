// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1482

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1482 implements IMessageParser 
    {

        private var _SafeStr_8479:int;
        private var _SafeStr_8480:int;
        private var _SafeStr_8481:Array;


        public function flush():Boolean
        {
            _SafeStr_8479 = -1;
            _SafeStr_8480 = -1;
            _SafeStr_8481 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_8479 = _arg_1.readInteger();
            _SafeStr_8480 = _arg_1.readInteger();
            _SafeStr_8481 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_8481.push(_arg_1.readInteger());
                _local_3++;
            };
            return (true);
        }

        public function get winningVoteCode():int
        {
            return (_SafeStr_8479);
        }

        public function get ownVoteCode():int
        {
            return (_SafeStr_8480);
        }

        public function get finalStatus():Array
        {
            return (_SafeStr_8481);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1482 = "_-s1d" (String#10195, DoABC#3)
// _SafeStr_8479 = "_-K1G" (String#7868, DoABC#3)
// _SafeStr_8480 = "_-u1J" (String#10312, DoABC#3)
// _SafeStr_8481 = "_-Hm" (String#7709, DoABC#3)


