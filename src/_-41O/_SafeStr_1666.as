// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-41O._SafeStr_1666

package _-41O
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1666 implements _SafeStr_1665 
    {

        private var _SafeStr_4128:int;
        private var _userName:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_7095:int;
        private var _SafeStr_7096:int;

        public function _SafeStr_1666(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _userName = _arg_1.readString();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_7095 = _arg_1.readInteger();
            _SafeStr_7096 = _arg_1.readInteger();
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get rank():int
        {
            return (_SafeStr_7095);
        }

        public function get currentScore():int
        {
            return (_SafeStr_7096);
        }


    }
}//package _-41O

// _SafeStr_1665 = "_-d1G" (String#9177, DoABC#3)
// _SafeStr_1666 = "_-oM" (String#9954, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7095 = "_-md" (String#9836, DoABC#3)
// _SafeStr_7096 = "_-nm" (String#9915, DoABC#3)


