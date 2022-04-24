// by nota

//_-31H._SafeStr_1184

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1184 implements IMessageParser 
    {

        private var _SafeStr_4734:int;
        private var _SafeStr_6321:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4734 = _arg_1.readInteger();
            _SafeStr_6321 = _arg_1.readInteger();
            return (true);
        }

        public function get homeRoomId():int
        {
            return (_SafeStr_4734);
        }

        public function get roomIdToEnter():int
        {
            return (_SafeStr_6321);
        }


    }
}//package _-31H

// _SafeStr_1184 = "_-rq" (String#10169, DoABC#3)
// _SafeStr_4734 = "_-fp" (String#9376, DoABC#3)
// _SafeStr_6321 = "_-mz" (String#9847, DoABC#3)


