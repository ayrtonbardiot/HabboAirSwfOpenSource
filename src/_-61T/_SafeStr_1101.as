// by nota

//_-61T._SafeStr_1101

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ol._SafeStr_1655;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1101 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1655;


        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            return (true);
        }

        public function get data():_SafeStr_1655
        {
            var _local_1:_SafeStr_1655 = _SafeStr_3740;
            if (_local_1 != null)
            {
                _local_1.setReadOnly();
            };
            return (_local_1);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_3740 = _SafeStr_1536.parseObjectData(_arg_1);
            _SafeStr_3740.ownerName = _arg_1.readString();
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1101 = "_-g15" (String#9387, DoABC#3)
// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_1655 = "_-f7" (String#9356, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


