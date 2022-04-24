// by nota

//_-g1G._SafeStr_1107

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1107 implements IMessageParser 
    {

        private var _SafeStr_7240:Boolean;
        private var _SafeStr_7241:int;
        private var _SafeStr_4897:Array;
        private var _SafeStr_4893:Array;
        private var _SafeStr_4898:Array;
        private var _SafeStr_5179:Array;


        public function get isWrappingEnabled():Boolean
        {
            return (_SafeStr_7240);
        }

        public function get wrappingPrice():int
        {
            return (_SafeStr_7241);
        }

        public function get stuffTypes():Array
        {
            return (_SafeStr_4897);
        }

        public function get boxTypes():Array
        {
            return (_SafeStr_4893);
        }

        public function get ribbonTypes():Array
        {
            return (_SafeStr_4898);
        }

        public function get defaultStuffTypes():Array
        {
            return (_SafeStr_5179);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_4897 = [];
            _SafeStr_4893 = [];
            _SafeStr_4898 = [];
            _SafeStr_5179 = [];
            _SafeStr_7240 = _arg_1.readBoolean();
            _SafeStr_7241 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4897.push(_arg_1.readInteger());
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4893.push(_arg_1.readInteger());
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4898.push(_arg_1.readInteger());
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_5179.push(_arg_1.readInteger());
                _local_3++;
            };
            return (true);
        }


    }
}//package _-g1G

// _SafeStr_1107 = "_-U1B" (String#8545, DoABC#3)
// _SafeStr_4893 = "_-T3" (String#8504, DoABC#3)
// _SafeStr_4897 = "_-A1a" (String#7227, DoABC#3)
// _SafeStr_4898 = "_-tv" (String#10301, DoABC#3)
// _SafeStr_5179 = "_-11b" (String#6549, DoABC#3)
// _SafeStr_7240 = "_-M1E" (String#7995, DoABC#3)
// _SafeStr_7241 = "_-EB" (String#7488, DoABC#3)


