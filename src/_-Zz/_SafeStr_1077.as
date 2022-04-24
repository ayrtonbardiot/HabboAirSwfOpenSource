// by nota

//_-Zz._SafeStr_1077

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1077 implements IMessageParser 
    {

        public static const _SafeStr_7891:int = 6;

        private var _SafeStr_7022:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7022 = _arg_1.readInteger();
            return (true);
        }

        public function get reason():int
        {
            return (_SafeStr_7022);
        }


    }
}//package _-Zz

// _SafeStr_1077 = "_-n1" (String#9848, DoABC#3)
// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)
// _SafeStr_7891 = "_-O1p" (String#8160, DoABC#3)


