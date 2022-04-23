// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1169

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1169 implements IMessageParser 
    {

        private var _SafeStr_4132:String;


        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function flush():Boolean
        {
            _SafeStr_4132 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4132 = _arg_1.readString();
            return (true);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1169 = "_-R1B" (String#8339, DoABC#3)
// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)


