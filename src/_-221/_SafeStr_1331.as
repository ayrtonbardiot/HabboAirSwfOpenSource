// by nota

//_-221._SafeStr_1331

package _-221
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1331 implements IMessageParser 
    {

        private var _SafeStr_7033:int;
        private var _SafeStr_7034:Boolean;
        private var _SafeStr_7035:int;
        private var _SafeStr_5358:Boolean;


        public function get userID():int
        {
            return (_SafeStr_7033);
        }

        public function get userCanTrade():Boolean
        {
            return (_SafeStr_7034);
        }

        public function get otherUserID():int
        {
            return (_SafeStr_7035);
        }

        public function get otherUserCanTrade():Boolean
        {
            return (_SafeStr_5358);
        }

        public function flush():Boolean
        {
            _SafeStr_7033 = -1;
            _SafeStr_7034 = false;
            _SafeStr_7035 = -1;
            _SafeStr_5358 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7033 = _arg_1.readInteger();
            _SafeStr_7034 = (_arg_1.readInteger() == 1);
            _SafeStr_7035 = _arg_1.readInteger();
            _SafeStr_5358 = (_arg_1.readInteger() == 1);
            return (true);
        }


    }
}//package _-221

// _SafeStr_1331 = "_-N18" (String#8053, DoABC#3)
// _SafeStr_5358 = "_-S1y" (String#8427, DoABC#3)
// _SafeStr_7033 = "_-x1b" (String#10533, DoABC#3)
// _SafeStr_7034 = "_-Ns" (String#8121, DoABC#3)
// _SafeStr_7035 = "_-Ew" (String#7524, DoABC#3)


