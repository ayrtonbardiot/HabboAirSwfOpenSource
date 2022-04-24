// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1093

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1093 implements IMessageParser 
    {

        private static const _SafeStr_8436:int = 0;
        private static const _SafeStr_8437:int = 1;
        private static const _SafeStr_8438:int = 2;

        private var _SafeStr_8439:int = -1;


        public function flush():Boolean
        {
            _SafeStr_8439 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8439 = _arg_1.readInteger();
            return (true);
        }

        public function get localizationCode():String
        {
            if (((_SafeStr_8439 == 0) || (_SafeStr_8439 == 1)))
            {
                return ("valid");
            };
            return ("invalid");
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1093 = "_-b1r" (String#9071, DoABC#3)
// _SafeStr_8436 = "_-Bs" (String#7348, DoABC#3)
// _SafeStr_8437 = "_-Qm" (String#8332, DoABC#3)
// _SafeStr_8438 = "_-fr" (String#9377, DoABC#3)
// _SafeStr_8439 = "_-f4" (String#9354, DoABC#3)


