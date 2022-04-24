// by nota

//_-613._SafeStr_1371

package _-613
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1371 implements IMessageParser 
    {

        private var _SafeStr_7099:Boolean;
        private var _SafeStr_7100:int;
        private var _SafeStr_7101:int;


        public function get isUnlocked():Boolean
        {
            return (_SafeStr_7099);
        }

        public function get totalBalance():int
        {
            return (_SafeStr_7100);
        }

        public function get withdrawBalance():int
        {
            return (_SafeStr_7101);
        }

        public function flush():Boolean
        {
            _SafeStr_7099 = false;
            _SafeStr_7100 = 0;
            _SafeStr_7101 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7099 = _arg_1.readBoolean();
            _SafeStr_7100 = _arg_1.readInteger();
            _SafeStr_7101 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-613

// _SafeStr_1371 = "_-id" (String#9566, DoABC#3)
// _SafeStr_7099 = "_-7l" (String#7058, DoABC#3)
// _SafeStr_7100 = "_-cb" (String#9150, DoABC#3)
// _SafeStr_7101 = "_-J1" (String#7764, DoABC#3)


