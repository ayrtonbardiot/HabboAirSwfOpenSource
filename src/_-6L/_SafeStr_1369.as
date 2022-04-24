// by nota

//_-6L._SafeStr_1369

package _-6L
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1369 implements IMessageParser 
    {

        private var _SafeStr_5666:int;
        private var _SafeStr_7122:int;
        private var _SafeStr_3740:String;


        public function get botId():int
        {
            return (_SafeStr_5666);
        }

        public function get commandId():int
        {
            return (_SafeStr_7122);
        }

        public function get data():String
        {
            return (_SafeStr_3740);
        }

        public function flush():Boolean
        {
            _SafeStr_5666 = -1;
            _SafeStr_7122 = -1;
            _SafeStr_3740 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5666 = _arg_1.readInteger();
            _SafeStr_7122 = _arg_1.readInteger();
            _SafeStr_3740 = _arg_1.readString();
            return (true);
        }


    }
}//package _-6L

// _SafeStr_1369 = "_-uL" (String#10348, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_5666 = "_-32J" (String#6745, DoABC#3)
// _SafeStr_7122 = "_-m1G" (String#9797, DoABC#3)


