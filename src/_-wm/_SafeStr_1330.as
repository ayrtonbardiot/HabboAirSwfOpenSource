// by nota

//_-wm._SafeStr_1330

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1330 implements IMessageParser 
    {

        private var _SafeStr_6095:int = -1;
        private var _SafeStr_3911:String;
        private var _SafeStr_4132:String;


        public function get typeCode():int
        {
            return (_SafeStr_6095);
        }

        public function get avatarId():String
        {
            return (_SafeStr_3911);
        }

        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3911 = _arg_1.readString();
            _SafeStr_6095 = _arg_1.readInteger();
            _SafeStr_4132 = _arg_1.readString();
            return (true);
        }


    }
}//package _-wm

// _SafeStr_1330 = "_-SS" (String#8446, DoABC#3)
// _SafeStr_3911 = "_-mj" (String#9839, DoABC#3)
// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)
// _SafeStr_6095 = "_-e12" (String#9263, DoABC#3)


