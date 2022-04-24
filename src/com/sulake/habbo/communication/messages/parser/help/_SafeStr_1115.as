// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1115

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1115 implements IMessageParser 
    {

        private var _SafeStr_5030:Boolean;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5030 = _arg_1.readBoolean();
            return (true);
        }

        public function get isTyping():Boolean
        {
            return (_SafeStr_5030);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1115 = "_-b1C" (String#9044, DoABC#3)
// _SafeStr_5030 = "_-KT" (String#7916, DoABC#3)


