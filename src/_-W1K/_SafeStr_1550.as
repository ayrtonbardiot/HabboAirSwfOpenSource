// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_1550

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1550 
    {

        private var _SafeStr_4977:int;
        private var _SafeStr_7674:int;
        private var _position:int;

        public function _SafeStr_1550(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4977 = _arg_1.readInteger();
            _SafeStr_7674 = _arg_1.readInteger();
            _position = _arg_1.readInteger();
        }

        public function get partId():int
        {
            return (_SafeStr_4977);
        }

        public function get colorId():int
        {
            return (_SafeStr_7674);
        }

        public function get position():int
        {
            return (_position);
        }


    }
}//package _-W1K

// _SafeStr_1550 = "_-zY" (String#10696, DoABC#3)
// _SafeStr_4977 = "_-HD" (String#7692, DoABC#3)
// _SafeStr_7674 = "_-l9" (String#9765, DoABC#3)


