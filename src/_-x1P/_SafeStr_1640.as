// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-x1P._SafeStr_1640

package _-x1P
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1640 implements _SafeStr_13 
    {

        private var _flatId:int;
        private var _SafeStr_6279:int;
        private var _SafeStr_7768:Boolean;
        private var _SafeStr_5226:int;
        private var _ownerName:String;
        private var _SafeStr_6842:_SafeStr_1662;
        private var _disposed:Boolean;

        public function _SafeStr_1640(_arg_1:IMessageDataWrapper)
        {
            _flatId = _arg_1.readInteger();
            _SafeStr_6279 = _arg_1.readInteger();
            _SafeStr_7768 = _arg_1.readBoolean();
            _SafeStr_5226 = _arg_1.readInteger();
            _ownerName = _arg_1.readString();
            _SafeStr_6842 = new _SafeStr_1662(_arg_1);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (_SafeStr_6842 != null)
            {
                _SafeStr_6842.dispose();
                _SafeStr_6842 = null;
            };
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get userCount():int
        {
            return (_SafeStr_6279);
        }

        public function get ownerInRoom():Boolean
        {
            return (_SafeStr_7768);
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function get room():_SafeStr_1662
        {
            return (_SafeStr_6842);
        }


    }
}//package _-x1P

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1640 = "_-m18" (String#9793, DoABC#3)
// _SafeStr_1662 = "_-dD" (String#9232, DoABC#3)
// _SafeStr_5226 = "_-Ld" (String#7981, DoABC#3)
// _SafeStr_6279 = "_-tN" (String#10281, DoABC#3)
// _SafeStr_6842 = "_-I1D" (String#7718, DoABC#3)
// _SafeStr_7768 = "_-w1T" (String#10453, DoABC#3)


