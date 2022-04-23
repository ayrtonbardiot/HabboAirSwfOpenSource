// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1113

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1113 implements IMessageParser 
    {

        private var _SafeStr_6942:int;
        private var _SafeStr_4786:int;
        private var _offerId:int;
        private var _SafeStr_4890:String;


        public function flush():Boolean
        {
            _SafeStr_6942 = -1;
            _SafeStr_4786 = -1;
            _offerId = -1;
            _SafeStr_4890 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_6942 = _arg_1.readInteger();
            _SafeStr_4786 = _arg_1.readInteger();
            _offerId = _arg_1.readInteger();
            _SafeStr_4890 = _arg_1.readString();
            return (true);
        }

        public function get appearsInSeconds():int
        {
            return (_SafeStr_6942);
        }

        public function get pageId():int
        {
            return (_SafeStr_4786);
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get productType():String
        {
            return (_SafeStr_4890);
        }


    }
}//package _-g1G

// _SafeStr_1113 = "_-H1P" (String#7668, DoABC#3)
// _SafeStr_4786 = "_-l1k" (String#9753, DoABC#3)
// _SafeStr_4890 = "_-91L" (String#7162, DoABC#3)
// _SafeStr_6942 = "_-i1r" (String#9541, DoABC#3)


