﻿// by nota

//_-61T._SafeStr_1235

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ol._SafeStr_1601;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1235 implements IMessageParser 
    {

        private var _SafeStr_4519:_SafeStr_1601 = null;


        public function flush():Boolean
        {
            _SafeStr_4519 = null;
            return (true);
        }

        public function get data():_SafeStr_1601
        {
            var _local_1:_SafeStr_1601 = _SafeStr_4519;
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
            _SafeStr_4519 = _SafeStr_1641.parseItemData(_arg_1);
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1235 = "_-s1I" (String#10181, DoABC#3)
// _SafeStr_1601 = "_-j5" (String#9615, DoABC#3)
// _SafeStr_1641 = "_-SL" (String#8441, DoABC#3)
// _SafeStr_4519 = "_-yg" (String#10644, DoABC#3)


