// by nota

//_-T1I._SafeStr_1443

package _-T1I
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1443 implements IMessageParser 
    {

        private var _SafeStr_6297:String;
        private var _SafeStr_4404:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_6297 = _arg_1.readString();
            _SafeStr_4404 = _arg_1.readString();
            return (true);
        }

        public function get schedulingStr():String
        {
            return (_SafeStr_6297);
        }

        public function get code():String
        {
            return (_SafeStr_4404);
        }


    }
}//package _-T1I

// _SafeStr_1443 = "_-k1I" (String#9670, DoABC#3)
// _SafeStr_4404 = "_-S1r" (String#8423, DoABC#3)
// _SafeStr_6297 = "_-84" (String#7112, DoABC#3)


