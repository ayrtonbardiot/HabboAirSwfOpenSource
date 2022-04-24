// by nota

//_-kC._SafeStr_1233

package _-kC
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-61T._SafeStr_1536;
    import com.sulake.habbo.room.object.data._SafeStr_1588;
    import _-qw._SafeStr_1590;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1233 implements IMessageParser 
    {

        private const _SafeStr_7352:int = 500;

        private var _offers:Array;
        private var _SafeStr_4797:int;


        public function flush():Boolean
        {
            _offers = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_11:int;
            var _local_13:int;
            var _local_2:int;
            var _local_4:int;
            var _local_9:* = null;
            var _local_10:int;
            var _local_7:int;
            var _local_12:int;
            var _local_6:int;
            var _local_3:* = null;
            _offers = [];
            var _local_5:String = "";
            _SafeStr_4797 = _arg_1.readInteger();
            var _local_8:int = _arg_1.readInteger();
            _local_6 = 0;
            while (_local_6 < _local_8)
            {
                _local_11 = _arg_1.readInteger();
                _local_13 = _arg_1.readInteger();
                _local_2 = _arg_1.readInteger();
                if (_local_2 == 1)
                {
                    _local_4 = _arg_1.readInteger();
                    _local_9 = _SafeStr_1536.parseStuffData(_arg_1);
                }
                else
                {
                    if (_local_2 == 2)
                    {
                        _local_4 = _arg_1.readInteger();
                        _local_5 = _arg_1.readString();
                    }
                    else
                    {
                        if (_local_2 == 3)
                        {
                            _local_4 = _arg_1.readInteger();
                            _local_9 = _SafeStr_1588.getStuffDataWrapperForType(0);
                            _local_9.uniqueSerialNumber = _arg_1.readInteger();
                            _local_9.uniqueSeriesSize = _arg_1.readInteger();
                            _local_2 = 1;
                        };
                    };
                };
                _local_10 = _arg_1.readInteger();
                _local_7 = _arg_1.readInteger();
                _local_12 = _arg_1.readInteger();
                _local_3 = new _SafeStr_1590(_local_11, _local_4, _local_2, _local_5, _local_9, _local_10, _local_13, _local_7, _local_12);
                if (_local_6 < 500)
                {
                    _offers.push(_local_3);
                };
                _local_6++;
            };
            return (true);
        }

        public function get offers():Array
        {
            return (_offers);
        }

        public function get creditsWaiting():int
        {
            return (_SafeStr_4797);
        }


    }
}//package _-kC

// _SafeStr_1233 = "_-nY" (String#9906, DoABC#3)
// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_1588 = "_-7O" (String#7045, DoABC#3)
// _SafeStr_1590 = "_-X1g" (String#8781, DoABC#3)
// _SafeStr_4797 = "_-iv" (String#9576, DoABC#3)
// _SafeStr_7352 = "_-12Z" (String#6573, DoABC#3)


