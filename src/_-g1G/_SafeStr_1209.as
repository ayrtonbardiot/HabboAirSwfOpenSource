// by nota

//_-g1G._SafeStr_1209

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1546;
    import __AS3__.vec.Vector;
    import _-AE._SafeStr_1406;
    import _-AE._SafeStr_1565;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1209 implements IMessageParser 
    {

        private var _SafeStr_4786:int;
        private var _SafeStr_3864:String;
        private var _SafeStr_6492:String;
        private var _localization:_SafeStr_1546;
        private var _offers:Vector.<_SafeStr_1406>;
        private var _offerId:int;
        private var _SafeStr_6493:Boolean;
        private var _frontPageItems:Vector.<_SafeStr_1565>;


        public function get pageId():int
        {
            return (_SafeStr_4786);
        }

        public function get catalogType():String
        {
            return (_SafeStr_3864);
        }

        public function get layoutCode():String
        {
            return (_SafeStr_6492);
        }

        public function get localization():_SafeStr_1546
        {
            return (_localization);
        }

        public function get offers():Vector.<_SafeStr_1406>
        {
            return (_offers);
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get acceptSeasonCurrencyAsCredits():Boolean
        {
            return (_SafeStr_6493);
        }

        public function get frontPageItems():Vector.<_SafeStr_1565>
        {
            return (_frontPageItems);
        }

        public function flush():Boolean
        {
            _SafeStr_4786 = -1;
            _SafeStr_3864 = "";
            _SafeStr_6492 = "";
            _localization = null;
            _offers = new Vector.<_SafeStr_1406>(0);
            _offerId = -1;
            _SafeStr_6493 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_4786 = _arg_1.readInteger();
            _SafeStr_3864 = _arg_1.readString();
            _SafeStr_6492 = _arg_1.readString();
            _localization = new _SafeStr_1546(_arg_1);
            _offers = new Vector.<_SafeStr_1406>(0);
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _offers.push(new _SafeStr_1406(_arg_1));
                _local_3++;
            };
            _offerId = _arg_1.readInteger();
            _SafeStr_6493 = _arg_1.readBoolean();
            if (_arg_1.bytesAvailable)
            {
                _frontPageItems = new Vector.<_SafeStr_1565>(0);
                _local_2 = _arg_1.readInteger();
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _frontPageItems.push(new _SafeStr_1565(_arg_1));
                    _local_3++;
                };
            };
            return (true);
        }


    }
}//package _-g1G

// _SafeStr_1209 = "_-x1h" (String#10536, DoABC#3)
// _SafeStr_1406 = "_-227" (String#6660, DoABC#3)
// _SafeStr_1546 = "_-9U" (String#7194, DoABC#3)
// _SafeStr_1565 = "_-i1o" (String#9540, DoABC#3)
// _SafeStr_3864 = "_-Qc" (String#8326, DoABC#3)
// _SafeStr_4786 = "_-l1k" (String#9753, DoABC#3)
// _SafeStr_6492 = "_-h1f" (String#9476, DoABC#3)
// _SafeStr_6493 = "_-A1B" (String#7213, DoABC#3)


