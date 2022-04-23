// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1228

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-w1o._SafeStr_1589;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1228 implements IMessageParser 
    {

        public static const _SafeStr_8460:int = 0;
        public static const _SafeStr_8461:int = 1;
        public static const _SafeStr_8462:int = 2;
        public static const _SafeStr_8463:int = 3;

        private var _SafeStr_8464:int;
        private var _SafeStr_8465:_SafeStr_1589;


        public function flush():Boolean
        {
            _SafeStr_8465 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8464 = _arg_1.readInteger();
            if (_SafeStr_8464 == 1)
            {
                _SafeStr_8465 = new _SafeStr_1589(_arg_1);
            };
            return (true);
        }

        public function get statusCode():int
        {
            return (_SafeStr_8464);
        }

        public function get pendingTicket():_SafeStr_1589
        {
            return (_SafeStr_8465);
        }

        public function get localizationCode():String
        {
            switch (_SafeStr_8464)
            {
                case 2:
                    return ("blocked");
                case 3:
                    return ("tooquick");
                default:
                    return ("");
            };
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1228 = "_-UC" (String#8571, DoABC#3)
// _SafeStr_1589 = "_-8d" (String#7136, DoABC#3)
// _SafeStr_8460 = "_-LR" (String#7973, DoABC#3)
// _SafeStr_8461 = "_-e1b" (String#9278, DoABC#3)
// _SafeStr_8462 = "_-K1e" (String#7878, DoABC#3)
// _SafeStr_8463 = "_-a1i" (String#8984, DoABC#3)
// _SafeStr_8464 = "_-I1N" (String#7723, DoABC#3)
// _SafeStr_8465 = "_-bw" (String#9097, DoABC#3)


