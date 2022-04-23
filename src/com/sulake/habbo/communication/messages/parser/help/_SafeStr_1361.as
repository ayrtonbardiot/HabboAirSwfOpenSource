// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1361

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1361 implements IMessageParser 
    {

        private var _SafeStr_8466:int;
        private var _SafeStr_7767:String;


        public function flush():Boolean
        {
            _SafeStr_8466 = -1;
            _SafeStr_7767 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8466 = _arg_1.readInteger();
            _SafeStr_7767 = _arg_1.readString();
            return (true);
        }

        public function get votingTimeout():int
        {
            return (_SafeStr_8466);
        }

        public function get chatRecord():String
        {
            return (_SafeStr_7767);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1361 = "_-z4" (String#10681, DoABC#3)
// _SafeStr_7767 = "_-31c" (String#6725, DoABC#3)
// _SafeStr_8466 = "_-I1x" (String#7736, DoABC#3)


