// by nota

//_-TY.Game2StartingGameFailedMessageParser

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2StartingGameFailedMessageParser implements IMessageParser 
    {

        public static const _SafeStr_7585:int = 1;
        public static const _SafeStr_7586:int = 2;

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
// _SafeStr_7585 = "_-Vo" (String#8650, DoABC#3)
// _SafeStr_7586 = "_-81a" (String#7085, DoABC#3)


