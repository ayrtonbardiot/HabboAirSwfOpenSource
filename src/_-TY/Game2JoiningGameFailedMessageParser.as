// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-TY.Game2JoiningGameFailedMessageParser

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2JoiningGameFailedMessageParser implements IMessageParser 
    {

        public static const _SafeStr_7576:int = 1;
        public static const _SafeStr_7577:int = 2;
        public static const _SafeStr_7578:int = 3;
        public static const _SafeStr_7579:int = 4;
        public static const _SafeStr_7580:int = 5;
        public static const _SafeStr_7581:int = 6;
        public static const _SafeStr_7582:int = 7;
        public static const _SafeStr_7583:int = 8;

        private var _SafeStr_7022:int;


        public function get reason():int
        {
            return (_SafeStr_7022);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7022 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-TY

// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)
// _SafeStr_7576 = "_-H1f" (String#7674, DoABC#3)
// _SafeStr_7577 = "_-BY" (String#7337, DoABC#3)
// _SafeStr_7578 = "_-x1e" (String#10534, DoABC#3)
// _SafeStr_7579 = "_-3I" (String#6767, DoABC#3)
// _SafeStr_7580 = "_-K1P" (String#7873, DoABC#3)
// _SafeStr_7581 = "_-r1o" (String#10140, DoABC#3)
// _SafeStr_7582 = "_-A1P" (String#7222, DoABC#3)
// _SafeStr_7583 = "_-91x" (String#7180, DoABC#3)


