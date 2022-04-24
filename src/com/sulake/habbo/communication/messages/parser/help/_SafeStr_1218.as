// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1218

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1218 implements IMessageParser 
    {

        private var _SafeStr_8454:int;


        public function flush():Boolean
        {
            _SafeStr_8454 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8454 = _arg_1.readInteger();
            return (true);
        }

        public function get acceptanceTimeout():int
        {
            return (_SafeStr_8454);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1218 = "_-ZL" (String#8937, DoABC#3)
// _SafeStr_8454 = "_-R1R" (String#8345, DoABC#3)


