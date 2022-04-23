// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-n1H._SafeStr_1625

package _-n1H
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1625 
    {

        public static const _SafeStr_7408:int = 0;
        public static const _SafeStr_7409:int = 1;
        public static const _SafeStr_7410:int = 2;
        public static const _SafeStr_7411:int = 4;
        public static const _SafeStr_7412:int = 5;

        private var _SafeStr_7413:int;
        private var _SafeStr_7414:int;
        private var _SafeStr_7415:int;

        public function _SafeStr_1625(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7413 = _arg_1.readInteger();
            _SafeStr_7414 = _arg_1.readInteger();
            _SafeStr_7415 = _arg_1.readInteger();
        }

        public function get whoCanMute():int
        {
            return (_SafeStr_7413);
        }

        public function get whoCanKick():int
        {
            return (_SafeStr_7414);
        }

        public function get whoCanBan():int
        {
            return (_SafeStr_7415);
        }


    }
}//package _-n1H

// _SafeStr_1625 = "_-Ug" (String#8591, DoABC#3)
// _SafeStr_7408 = "_-t2" (String#10270, DoABC#3)
// _SafeStr_7409 = "_-d1M" (String#9180, DoABC#3)
// _SafeStr_7410 = "_-sJ" (String#10216, DoABC#3)
// _SafeStr_7411 = "_-b4" (String#9074, DoABC#3)
// _SafeStr_7412 = "_-fv" (String#9378, DoABC#3)
// _SafeStr_7413 = "_-XF" (String#8799, DoABC#3)
// _SafeStr_7414 = "_-H12" (String#7657, DoABC#3)
// _SafeStr_7415 = "_-re" (String#10163, DoABC#3)


