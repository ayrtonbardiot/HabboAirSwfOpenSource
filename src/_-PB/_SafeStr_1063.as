// by nota

//_-PB._SafeStr_1063

package _-PB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-b1c._SafeStr_1532;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1063 implements IMessageParser 
    {

        private var _SafeStr_5990:_SafeStr_1532;
        private var _SafeStr_6097:_SafeStr_1532;


        public function get resultData():_SafeStr_1532
        {
            return (_SafeStr_5990);
        }

        public function get otherResultData():_SafeStr_1532
        {
            return (_SafeStr_6097);
        }

        public function flush():Boolean
        {
            return (true);
        }

        private function parseResultData(_arg_1:IMessageDataWrapper):_SafeStr_1532
        {
            var _local_2:int = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            var _local_4:String = _arg_1.readString();
            var _local_7:int = _arg_1.readInteger();
            var _local_6:String = _arg_1.readString();
            var _local_5:int = _arg_1.readInteger();
            var _local_8:Boolean = _arg_1.readBoolean();
            return (new _SafeStr_1532(_local_2, _local_3, _local_4, _local_7, _local_6, _local_5, _local_8));
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5990 = parseResultData(_arg_1);
            _SafeStr_6097 = parseResultData(_arg_1);
            return (true);
        }


    }
}//package _-PB

// _SafeStr_1063 = "_-ae" (String#9023, DoABC#3)
// _SafeStr_1532 = "_-2k" (String#6701, DoABC#3)
// _SafeStr_5990 = "_-w1h" (String#10461, DoABC#3)
// _SafeStr_6097 = "_-j1F" (String#9589, DoABC#3)


