// by nota

//_-sq._SafeStr_1472

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1472 implements IMessageParser 
    {

        public static const _SafeStr_7529:int = 1;
        public static const _SafeStr_7530:int = 2;
        public static const _SafeStr_7531:int = 3;
        public static const _SafeStr_7532:int = 4;

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
}//package _-sq

// _SafeStr_1472 = "_-Mo" (String#8040, DoABC#3)
// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)
// _SafeStr_7529 = "_-A1N" (String#7220, DoABC#3)
// _SafeStr_7530 = "_-O10" (String#8129, DoABC#3)
// _SafeStr_7531 = "_-Vp" (String#8651, DoABC#3)
// _SafeStr_7532 = "_-nr" (String#9916, DoABC#3)


