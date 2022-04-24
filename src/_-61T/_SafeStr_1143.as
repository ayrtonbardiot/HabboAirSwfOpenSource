// by nota

//_-61T._SafeStr_1143

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ol._SafeStr_1614;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1143 implements IMessageParser 
    {

        private var _SafeStr_4621:Array = [];


        public function get objectCount():int
        {
            return (_SafeStr_4621.length);
        }

        public function getObjectData(_arg_1:int):_SafeStr_1614
        {
            if (((_arg_1 < 0) || (_arg_1 >= objectCount)))
            {
                return (null);
            };
            return (_SafeStr_4621[_arg_1]);
        }

        public function flush():Boolean
        {
            _SafeStr_4621 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:* = null;
            var _local_6:int;
            var _local_7:Number;
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_5 = _arg_1.readInteger();
                _local_2 = _SafeStr_1536.parseStuffData(_arg_1);
                _local_6 = 0;
                _local_7 = parseFloat(_local_2.getLegacyString());
                if (!isNaN(_local_7))
                {
                    _local_6 = _local_2.getLegacyString();
                };
                _SafeStr_4621.push(new _SafeStr_1614(_local_5, _local_6, _local_2));
                _local_4++;
            };
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1143 = "_-tO" (String#10282, DoABC#3)
// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_1614 = "_-sU" (String#10221, DoABC#3)
// _SafeStr_4621 = "_-21w" (String#6655, DoABC#3)


