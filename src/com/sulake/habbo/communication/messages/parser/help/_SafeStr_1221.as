// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1221

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1221 implements IMessageParser 
    {

        private static const _SafeStr_8455:int = 0;
        private static const _SafeStr_8456:int = 1;
        private static const _SafeStr_8457:int = 2;
        private static const _SafeStr_8458:int = 3;

        private var _SafeStr_4258:int = -1;


        public function flush():Boolean
        {
            _SafeStr_4258 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4258 = _arg_1.readInteger();
            return (true);
        }

        public function get localizationCode():String
        {
            switch (_SafeStr_4258)
            {
                case 0:
                    return ("sent");
                case 1:
                    return ("blocked");
                case 2:
                    return ("nochat");
                case 3:
                    return ("alreadyreported");
                default:
                    return ("invalid");
            };
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1221 = "_-vc" (String#10421, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)
// _SafeStr_8455 = "_-2O" (String#6691, DoABC#3)
// _SafeStr_8456 = "_-316" (String#6714, DoABC#3)
// _SafeStr_8457 = "_-Nl" (String#8116, DoABC#3)
// _SafeStr_8458 = "_-xL" (String#10557, DoABC#3)


