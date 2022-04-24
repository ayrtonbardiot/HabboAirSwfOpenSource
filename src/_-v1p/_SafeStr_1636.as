// by nota

//_-v1p._SafeStr_1636

package _-v1p
{
    import _-x1P._SafeStr_1635;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1636 implements _SafeStr_1635 
    {

        private var _name:String;
        private var _SafeStr_7617:int;
        private var _SafeStr_7618:int;
        private var _SafeStr_7619:Boolean;
        private var _SafeStr_7620:String = "";
        private var _SafeStr_7621:String = "";

        public function _SafeStr_1636(_arg_1:IMessageDataWrapper)
        {
            _name = _arg_1.readString();
            _SafeStr_7617 = _arg_1.readInteger();
            _SafeStr_7618 = _arg_1.readInteger();
            _SafeStr_7619 = _arg_1.readBoolean();
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_7620 = _arg_1.readString();
            };
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_7621 = _arg_1.readString();
            };
        }

        public function get name():String
        {
            return (_name);
        }

        public function get sanctionLengthInHours():int
        {
            return (_SafeStr_7617);
        }

        public function get avatarOnly():Boolean
        {
            return (_SafeStr_7619);
        }

        public function get tradeLockInfo():String
        {
            return (_SafeStr_7620);
        }

        public function get machineBanInfo():String
        {
            return (_SafeStr_7621);
        }


    }
}//package _-v1p

// _SafeStr_1635 = "_-h" (String#9442, DoABC#3)
// _SafeStr_1636 = "_-iU" (String#9561, DoABC#3)
// _SafeStr_7617 = "_-J1m" (String#7782, DoABC#3)
// _SafeStr_7618 = "_-G6" (String#7618, DoABC#3)
// _SafeStr_7619 = "_-Qg" (String#8328, DoABC#3)
// _SafeStr_7620 = "_-2j" (String#6700, DoABC#3)
// _SafeStr_7621 = "_-21e" (String#6637, DoABC#3)


