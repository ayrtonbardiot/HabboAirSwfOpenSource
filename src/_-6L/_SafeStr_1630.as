// by nota

//_-6L._SafeStr_1630

package _-6L
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1630 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_3740:String;

        public function _SafeStr_1630(_arg_1:IMessageDataWrapper)
        {
            parse(_arg_1);
        }

        public function parse(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_3740 = _arg_1.readString();
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get data():String
        {
            return (_SafeStr_3740);
        }


    }
}//package _-6L

// _SafeStr_1630 = "_-N1E" (String#8056, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)


