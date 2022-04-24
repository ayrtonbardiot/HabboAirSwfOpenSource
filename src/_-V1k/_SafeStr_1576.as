// by nota

//_-V1k._SafeStr_1576

package _-V1k
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1576 implements _SafeStr_13 
    {

        private var _SafeStr_7597:String;
        private var _SafeStr_5170:int;
        private var _SafeStr_7598:int;
        private var _SafeStr_4036:Boolean = false;

        public function _SafeStr_1576(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7597 = _arg_1.readString();
            _SafeStr_5170 = _arg_1.readInteger();
            _SafeStr_7598 = _arg_1.readInteger();
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            _SafeStr_7597 = "";
            _SafeStr_5170 = -1;
            _SafeStr_7598 = -1;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get pattern():String
        {
            return (_SafeStr_7597);
        }

        public function get startIndex():int
        {
            return (_SafeStr_5170);
        }

        public function get endIndex():int
        {
            return (_SafeStr_7598);
        }


    }
}//package _-V1k

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1576 = "_-h15" (String#9456, DoABC#3)
// _SafeStr_4036 = "_-Mr" (String#8042, DoABC#3)
// _SafeStr_5170 = "_-x1C" (String#10506, DoABC#3)
// _SafeStr_7597 = "_-327" (String#6737, DoABC#3)
// _SafeStr_7598 = "_-L1Q" (String#7945, DoABC#3)


