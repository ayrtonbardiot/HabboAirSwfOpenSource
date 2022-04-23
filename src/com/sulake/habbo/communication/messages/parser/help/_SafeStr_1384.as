// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1384

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1384 implements IMessageParser 
    {

        private var _SafeStr_8476:int;
        private var _SafeStr_5806:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8476 = _arg_1.readInteger();
            _SafeStr_5806 = _arg_1.readString();
            return (true);
        }

        public function get closeReason():int
        {
            return (_SafeStr_8476);
        }

        public function get messageText():String
        {
            return (_SafeStr_5806);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1384 = "_-R1n" (String#8354, DoABC#3)
// _SafeStr_5806 = "_-F1i" (String#7550, DoABC#3)
// _SafeStr_8476 = "_-TE" (String#8511, DoABC#3)


