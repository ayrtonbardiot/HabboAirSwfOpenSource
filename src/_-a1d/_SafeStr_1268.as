// by nota

//_-a1d._SafeStr_1268

package _-a1d
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1268 implements IMessageParser 
    {

        private var _SafeStr_7134:Vector.<_SafeStr_1544> = new Vector.<_SafeStr_1544>(0);
        private var _SafeStr_7135:Vector.<String> = new Vector.<String>(0);


        public function flush():Boolean
        {
            _SafeStr_7134 = new Vector.<_SafeStr_1544>(0);
            _SafeStr_7135 = new Vector.<String>(0);
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7134.push(new _SafeStr_1544(_arg_1));
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7135.push(_arg_1.readString());
                _local_3++;
            };
            return (true);
        }

        public function get recipeProductItems():Vector.<_SafeStr_1544>
        {
            return (_SafeStr_7134);
        }

        public function get usableInventoryFurniClasses():Vector.<String>
        {
            return (_SafeStr_7135);
        }

        public function hasData():Boolean
        {
            return ((_SafeStr_7134.length > 0) || (_SafeStr_7135.length > 0));
        }


    }
}//package _-a1d

// _SafeStr_1268 = "_-me" (String#9837, DoABC#3)
// _SafeStr_1544 = "_-F19" (String#7531, DoABC#3)
// _SafeStr_7134 = "_-k1f" (String#9682, DoABC#3)
// _SafeStr_7135 = "_-wT" (String#10483, DoABC#3)


