// by nota

//_-31H._SafeStr_1082

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.runtime._SafeStr_13;
    import _-Ja._SafeStr_1569;
    import _-n1H._SafeStr_1625;
    import _-n1H._SafeStr_1626;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1082 implements IMessageParser, _SafeStr_13 
    {

        private var _SafeStr_7045:Boolean;
        private var _SafeStr_7046:Boolean;
        private var _SafeStr_7047:Boolean;
        private var _SafeStr_3740:_SafeStr_1569;
        private var _SafeStr_7048:Boolean;
        private var _SafeStr_5016:_SafeStr_1625;
        private var _SafeStr_7049:_SafeStr_1626;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_7045 = _arg_1.readBoolean();
            this._SafeStr_3740 = new _SafeStr_1569(_arg_1);
            this._SafeStr_7046 = _arg_1.readBoolean();
            this._SafeStr_7047 = _arg_1.readBoolean();
            this._SafeStr_7048 = _arg_1.readBoolean();
            var _local_2:Boolean = _arg_1.readBoolean();
            this._SafeStr_5016 = new _SafeStr_1625(_arg_1);
            this._SafeStr_3740.allInRoomMuted = _local_2;
            this._SafeStr_3740.canMute = _arg_1.readBoolean();
            this._SafeStr_7049 = new _SafeStr_1626(_arg_1);
            return (true);
        }

        public function dispose():void
        {
            _SafeStr_5016 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_5016 == null);
        }

        public function get enterRoom():Boolean
        {
            return (_SafeStr_7045);
        }

        public function get data():_SafeStr_1569
        {
            return (_SafeStr_3740);
        }

        public function get roomForward():Boolean
        {
            return (_SafeStr_7046);
        }

        public function get staffPick():Boolean
        {
            return (_SafeStr_7047);
        }

        public function get isGroupMember():Boolean
        {
            return (_SafeStr_7048);
        }

        public function get roomModerationSettings():_SafeStr_1625
        {
            return (_SafeStr_5016);
        }

        public function get chatSettings():_SafeStr_1626
        {
            return (_SafeStr_7049);
        }


    }
}//package _-31H

// _SafeStr_1082 = "_-51j" (String#6893, DoABC#3)
// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1569 = "_-R1p" (String#8356, DoABC#3)
// _SafeStr_1625 = "_-Ug" (String#8591, DoABC#3)
// _SafeStr_1626 = "_-51" (String#6869, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_5016 = "_-32x" (String#6760, DoABC#3)
// _SafeStr_7045 = "_-fC" (String#9358, DoABC#3)
// _SafeStr_7046 = "_-pP" (String#10009, DoABC#3)
// _SafeStr_7047 = "_-3a" (String#6782, DoABC#3)
// _SafeStr_7048 = "_-I7" (String#7741, DoABC#3)
// _SafeStr_7049 = "_-FY" (String#7569, DoABC#3)


