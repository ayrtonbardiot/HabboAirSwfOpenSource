// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1222

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1222 implements IMessageParser 
    {

        private var _SafeStr_8459:int = 0;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8459 = _arg_1.readInteger();
            return (true);
        }

        public function get endReason():int
        {
            return (_SafeStr_8459);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1222 = "_-ip" (String#9572, DoABC#3)
// _SafeStr_8459 = "_-DM" (String#7448, DoABC#3)


