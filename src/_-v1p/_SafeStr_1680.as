// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-v1p._SafeStr_1680

package _-v1p
{
    import _-x1P._SafeStr_1635;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1680 implements _SafeStr_1635 
    {

        private var _SafeStr_7623:String;
        private var _SafeStr_7624:int;
        private var _SafeStr_7625:String;

        public function _SafeStr_1680(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7623 = _arg_1.readString();
            _SafeStr_7624 = _arg_1.readInteger();
            _SafeStr_7625 = _arg_1.readString();
        }

        public function get name():String
        {
            return (_SafeStr_7623);
        }

        public function get id():int
        {
            return (_SafeStr_7624);
        }

        public function get consequence():String
        {
            return (_SafeStr_7625);
        }


    }
}//package _-v1p

// _SafeStr_1635 = "_-h" (String#9442, DoABC#3)
// _SafeStr_1680 = "_-61U" (String#6949, DoABC#3)
// _SafeStr_7623 = "_-p1E" (String#9978, DoABC#3)
// _SafeStr_7624 = "_-12v" (String#6586, DoABC#3)
// _SafeStr_7625 = "_-h9" (String#9487, DoABC#3)


