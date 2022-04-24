// by nota

//_-g1G._SafeStr_1484

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import _-AE._SafeStr_1406;
    import _-AE._SafeStr_1537;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1484 implements IMessageParser 
    {

        private var _SafeStr_4979:int;
        private var _SafeStr_4980:int;
        private var _offers:Array;
        private var _SafeStr_4982:_SafeStr_24;


        public function flush():Boolean
        {
            if (_SafeStr_4982)
            {
                _SafeStr_4982.dispose();
                _SafeStr_4982 = null;
            };
            _offers = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_2:* = null;
            _SafeStr_4979 = _arg_1.readInteger();
            _SafeStr_4980 = _arg_1.readInteger();
            _offers = [];
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _offers.push(new _SafeStr_1406(_arg_1));
                _local_4++;
            };
            _SafeStr_4982 = new _SafeStr_24();
            _local_3 = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = new _SafeStr_1537(_arg_1);
                _SafeStr_4982.add(_local_2.offerId, _local_2);
                _local_4++;
            };
            return (true);
        }

        public function get daysUntilNextGift():int
        {
            return (_SafeStr_4979);
        }

        public function get giftsAvailable():int
        {
            return (_SafeStr_4980);
        }

        public function get offers():Array
        {
            return (_offers);
        }

        public function get giftData():_SafeStr_24
        {
            return (_SafeStr_4982);
        }


    }
}//package _-g1G

// _SafeStr_1406 = "_-227" (String#6660, DoABC#3)
// _SafeStr_1484 = "_-UW" (String#8583, DoABC#3)
// _SafeStr_1537 = "_-a1D" (String#8963, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4979 = "_-M1d" (String#8008, DoABC#3)
// _SafeStr_4980 = "_-E1z" (String#7485, DoABC#3)
// _SafeStr_4982 = "_-510" (String#6870, DoABC#3)


