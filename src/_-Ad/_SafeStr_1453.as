// by nota

//_-Ad._SafeStr_1453

package _-Ad
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1453 implements IMessageParser 
    {

        private var _SafeStr_7147:String;
        private var _SafeStr_7148:Boolean;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7147 = _arg_1.readString();
            _SafeStr_7148 = _arg_1.readBoolean();
            return (true);
        }

        public function get requestCode():String
        {
            return (_SafeStr_7147);
        }

        public function get fulfilled():Boolean
        {
            return (_SafeStr_7148);
        }


    }
}//package _-Ad

// _SafeStr_1453 = "_-ka" (String#9707, DoABC#3)
// _SafeStr_7147 = "_-KY" (String#7919, DoABC#3)
// _SafeStr_7148 = "_-6t" (String#7003, DoABC#3)


