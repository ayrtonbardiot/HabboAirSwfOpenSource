// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-n1H._SafeStr_1639

package _-n1H
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1639 implements _SafeStr_1627 
    {

        private var _SafeStr_4128:int;
        private var _userName:String;

        public function _SafeStr_1639(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _userName = _arg_1.readString();
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }


    }
}//package _-n1H

// _SafeStr_1627 = "_-k1s" (String#9690, DoABC#3)
// _SafeStr_1639 = "_-O1B" (String#8133, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)


