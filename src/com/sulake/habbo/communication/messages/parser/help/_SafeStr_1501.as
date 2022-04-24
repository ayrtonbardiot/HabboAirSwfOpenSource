// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1501

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1501 implements IMessageParser 
    {

        private var _SafeStr_8482:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8482 = _arg_1.readInteger();
            return (true);
        }

        public function getRequesterRoomId():int
        {
            return (_SafeStr_8482);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1501 = "_-Z19" (String#8889, DoABC#3)
// _SafeStr_8482 = "_-os" (String#9963, DoABC#3)


