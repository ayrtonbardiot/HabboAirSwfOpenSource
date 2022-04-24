// by nota

//_-g1G._SafeStr_1328

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1328 implements IMessageParser 
    {

        private var _SafeStr_4890:String;
        private var _SafeStr_4710:int;
        private var _totalCoinsForBonus:int;
        private var _SafeStr_6926:int;


        public function flush():Boolean
        {
            _totalCoinsForBonus = -1;
            _SafeStr_6926 = -1;
            _SafeStr_4890 = "";
            _SafeStr_4710 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4890 = _arg_1.readString();
            _SafeStr_4710 = _arg_1.readInteger();
            _totalCoinsForBonus = _arg_1.readInteger();
            _SafeStr_6926 = _arg_1.readInteger();
            return (true);
        }

        public function get totalCoinsForBonus():int
        {
            return (_totalCoinsForBonus);
        }

        public function get coinsStillRequiredToBuy():int
        {
            return (_SafeStr_6926);
        }

        public function get productType():String
        {
            return (_SafeStr_4890);
        }

        public function get productClassId():int
        {
            return (_SafeStr_4710);
        }


    }
}//package _-g1G

// _SafeStr_1328 = "_-Th" (String#8527, DoABC#3)
// _SafeStr_4710 = "_-L1U" (String#7946, DoABC#3)
// _SafeStr_4890 = "_-91L" (String#7162, DoABC#3)
// _SafeStr_6926 = "_-F1P" (String#7540, DoABC#3)


