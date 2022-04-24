// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1204

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1204 implements IMessageParser 
    {

        public static const _SafeStr_8449:int = 0;
        public static const _SafeStr_8450:int = 1;
        public static const _SafeStr_8451:int = 2;
        public static const _SafeStr_8452:int = 3;
        public static const _SafeStr_8453:int = 4;

        private var _SafeStr_7053:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7053 = _arg_1.readInteger();
            return (true);
        }

        public function get errorCode():int
        {
            return (_SafeStr_7053);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1204 = "_-G1i" (String#7605, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)
// _SafeStr_8449 = "_-q3" (String#10069, DoABC#3)
// _SafeStr_8450 = "_-p1L" (String#9981, DoABC#3)
// _SafeStr_8451 = "_-7D" (String#7039, DoABC#3)
// _SafeStr_8452 = "_-b1W" (String#9053, DoABC#3)
// _SafeStr_8453 = "_-h14" (String#9455, DoABC#3)


