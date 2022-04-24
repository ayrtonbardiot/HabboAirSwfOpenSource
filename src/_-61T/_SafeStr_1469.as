// by nota

//_-61T._SafeStr_1469

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ol._SafeStr_1601;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1469 implements IMessageParser 
    {

        private var _items:Array = [];


        public function flush():Boolean
        {
            _items = [];
            return (true);
        }

        public function getItemCount():int
        {
            return (_items.length);
        }

        public function getItem(_arg_1:int):_SafeStr_1601
        {
            if (((_arg_1 < 0) || (_arg_1 >= getItemCount())))
            {
                return (null);
            };
            var _local_2:_SafeStr_1601 = (_items[_arg_1] as _SafeStr_1601);
            if (_local_2 != null)
            {
                _local_2.setReadOnly();
            };
            return (_local_2);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_5:int;
            var _local_7:int;
            var _local_3:* = null;
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return (false);
            };
            _items = [];
            var _local_6:_SafeStr_24 = new _SafeStr_24();
            var _local_4:int = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_7 = _arg_1.readInteger();
                _local_3 = _arg_1.readString();
                _local_6.add(_local_7, _local_3);
                _local_5++;
            };
            var _local_8:int = _arg_1.readInteger();
            _SafeStr_14.log((("We have: " + _local_8) + " items"));
            _local_5 = 0;
            while (_local_5 < _local_8)
            {
                _local_2 = _SafeStr_1641.parseItemData(_arg_1);
                _local_2.ownerName = _local_6.getValue(_local_2.ownerId);
                _items.push(_local_2);
                _local_5++;
            };
            return (true);
        }


    }
}//package _-61T

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_1469 = "_-q1d" (String#10057, DoABC#3)
// _SafeStr_1601 = "_-j5" (String#9615, DoABC#3)
// _SafeStr_1641 = "_-SL" (String#8441, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)


