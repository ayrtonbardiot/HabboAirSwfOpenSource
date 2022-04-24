// by nota

//_-l1n._SafeStr_1338

package _-l1n
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1338 implements IMessageParser 
    {

        public static const _SafeStr_7379:int = 1;
        public static const _SafeStr_7380:int = 2;
        public static const _SafeStr_7381:int = 3;
        public static const _SafeStr_7382:int = 4;

        private var _SafeStr_7022:int = 0;
        private var _SafeStr_4118:String = "";


        public function flush():Boolean
        {
            _SafeStr_7022 = 0;
            _SafeStr_4118 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7022 = _arg_1.readInteger();
            if (_SafeStr_7022 == 3)
            {
                _SafeStr_4118 = _arg_1.readString();
            }
            else
            {
                _SafeStr_4118 = "";
            };
            return (true);
        }

        public function get reason():int
        {
            return (_SafeStr_7022);
        }

        public function get parameter():String
        {
            return (_SafeStr_4118);
        }


    }
}//package _-l1n

// _SafeStr_1338 = "_-x2" (String#10545, DoABC#3)
// _SafeStr_4118 = "_-M1c" (String#8007, DoABC#3)
// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)
// _SafeStr_7379 = "_-O1e" (String#8156, DoABC#3)
// _SafeStr_7380 = "_-f1" (String#9320, DoABC#3)
// _SafeStr_7381 = "_-w1Q" (String#10451, DoABC#3)
// _SafeStr_7382 = "_-Py" (String#8281, DoABC#3)


