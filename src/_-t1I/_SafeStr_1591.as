// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-t1I._SafeStr_1591

package _-t1I
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1591 
    {

        private var _SafeStr_4838:String;
        private var _SafeStr_7536:int;

        public function _SafeStr_1591(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4838 = _arg_1.readString();
            _SafeStr_7536 = _arg_1.readInteger();
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get vipDays():int
        {
            return (_SafeStr_7536);
        }


    }
}//package _-t1I

// _SafeStr_1591 = "_-e1N" (String#9272, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)
// _SafeStr_7536 = "_-5y" (String#6933, DoABC#3)


