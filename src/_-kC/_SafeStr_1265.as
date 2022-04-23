// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-kC._SafeStr_1265

package _-kC
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.room.IStuffData;
    import _-61T._SafeStr_1536;
    import com.sulake.habbo.room.object.data._SafeStr_1588;
    import _-qw._SafeStr_1590;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1265 implements IMessageParser 
    {

        public static const _SafeStr_7353:int = 1;
        public static const _SafeStr_7354:int = 2;
        public static const _SafeStr_7355:int = 3;

        private const _SafeStr_7352:int = 500;

        private var _offers:Array;
        private var _SafeStr_4795:int;


        public function flush():Boolean
        {
            _offers = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_12:int;
            var _local_14:int;
            var _local_2:int;
            var _local_4:int;
            var _local_11:int;
            var _local_8:int;
            var _local_13:int;
            var _local_6:int;
            var _local_7:int;
            var _local_3:* = null;
            _offers = [];
            var _local_5:String = "";
            var _local_10:IStuffData;
            var _local_9:int = _arg_1.readInteger();
            _local_7 = 0;
            while (_local_7 < _local_9)
            {
                _local_10 = null;
                _local_12 = _arg_1.readInteger();
                _local_14 = _arg_1.readInteger();
                _local_2 = _arg_1.readInteger();
                if (_local_2 == 1)
                {
                    _local_4 = _arg_1.readInteger();
                    _local_10 = _SafeStr_1536.parseStuffData(_arg_1);
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
                            _local_10 = _SafeStr_1588.getStuffDataWrapperForType(0);
                            _local_10.uniqueSerialNumber = _arg_1.readInteger();
                            _local_10.uniqueSeriesSize = _arg_1.readInteger();
                            _local_2 = 1;
                        };
                    };
                };
                _local_11 = _arg_1.readInteger();
                _local_8 = _arg_1.readInteger();
                _local_13 = _arg_1.readInteger();
                _local_6 = _arg_1.readInteger();
                _local_3 = new _SafeStr_1590(_local_12, _local_4, _local_2, _local_5, _local_10, _local_11, _local_14, _local_8, _local_13, _local_6);
                if (_local_7 < 500)
                {
                    _offers.push(_local_3);
                };
                _local_7++;
            };
            _SafeStr_4795 = _arg_1.readInteger();
            return (true);
        }

        public function get offers():Array
        {
            return (_offers);
        }

        public function get totalItemsFound():int
        {
            return (_SafeStr_4795);
        }


    }
}//package _-kC

// _SafeStr_1265 = "_-x1B" (String#10505, DoABC#3)
// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_1588 = "_-7O" (String#7045, DoABC#3)
// _SafeStr_1590 = "_-X1g" (String#8781, DoABC#3)
// _SafeStr_4795 = "_-dR" (String#9238, DoABC#3)
// _SafeStr_7352 = "_-12Z" (String#6573, DoABC#3)
// _SafeStr_7353 = "_-y1K" (String#10584, DoABC#3)
// _SafeStr_7354 = "_-e1Q" (String#9274, DoABC#3)
// _SafeStr_7355 = "_-sp" (String#10234, DoABC#3)


