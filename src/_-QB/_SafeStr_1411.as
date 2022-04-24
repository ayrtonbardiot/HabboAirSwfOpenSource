// by nota

//_-QB._SafeStr_1411

package _-QB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1411 implements IMessageParser 
    {

        private var _SafeStr_3820:int = -1;
        private var _SafeStr_4028:String = "";
        private var _headline:String = "";
        private var _SafeStr_4005:String = "";


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get headline():String
        {
            return (_headline);
        }

        public function get summary():String
        {
            return (_SafeStr_4005);
        }

        public function flush():Boolean
        {
            _SafeStr_3820 = -1;
            _SafeStr_4028 = "";
            _SafeStr_4005 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_4028 = _arg_1.readString();
            _headline = _arg_1.readString();
            _SafeStr_4005 = _arg_1.readString();
            return (true);
        }


    }
}//package _-QB

// _SafeStr_1411 = "_-v1k" (String#10393, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4005 = "_-Rc" (String#8380, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)


