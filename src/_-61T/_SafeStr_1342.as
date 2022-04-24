// by nota

//_-61T._SafeStr_1342

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ol._SafeStr_1655;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1342 implements IMessageParser 
    {

        private var _SafeStr_4621:Array = [];


        public function flush():Boolean
        {
            _SafeStr_4621 = [];
            return (true);
        }

        public function getObjectCount():int
        {
            return (_SafeStr_4621.length);
        }

        public function getObject(_arg_1:int):_SafeStr_1655
        {
            if (((_arg_1 < 0) || (_arg_1 >= getObjectCount())))
            {
                return (null);
            };
            var _local_2:_SafeStr_1655 = (_SafeStr_4621[_arg_1] as _SafeStr_1655);
            if (_local_2 != null)
            {
                _local_2.setReadOnly();
            };
            return (_local_2);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_6:int;
            var _local_2:* = null;
            var _local_8:* = null;
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4621 = [];
            var _local_5:_SafeStr_24 = new _SafeStr_24();
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_6 = _arg_1.readInteger();
                _local_2 = _arg_1.readString();
                _local_5.add(_local_6, _local_2);
                _local_4++;
            };
            var _local_7:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_7)
            {
                _local_8 = _SafeStr_1536.parseObjectData(_arg_1);
                if (_local_8 != null)
                {
                    _local_8.ownerName = _local_5.getValue(_local_8.ownerId);
                    _SafeStr_4621.push(_local_8);
                };
                _local_4++;
            };
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1342 = "_-87" (String#7114, DoABC#3)
// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_1655 = "_-f7" (String#9356, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4621 = "_-21w" (String#6655, DoABC#3)


