// by nota

//_-28._SafeStr_1409

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1409 implements IMessageParser 
    {

        private var _SafeStr_4028:String;
        private var _parameters:_SafeStr_24;


        public function flush():Boolean
        {
            _SafeStr_4028 = null;
            _parameters = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_5:* = null;
            var _local_4:* = null;
            _SafeStr_4028 = _arg_1.readString();
            _parameters = new _SafeStr_24();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_5 = _arg_1.readString();
                _local_4 = _arg_1.readString();
                _parameters.add(_local_5, _local_4);
                _local_3++;
            };
            return (true);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get parameters():_SafeStr_24
        {
            return (_parameters);
        }


    }
}//package _-28

// _SafeStr_1409 = "_-pg" (String#10014, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)


