// by nota

//_-A1o._SafeStr_1325

package _-A1o
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1325 implements IMessageParser 
    {

        private var _traxVolume:int;
        private var _furniVolume:int;
        private var _uiVolume:int;
        private var _SafeStr_7140:Boolean;
        private var _SafeStr_3760:Boolean;
        private var _SafeStr_7141:Boolean;
        private var _SafeStr_3822:int;
        private var _SafeStr_3785:int;


        public function get traxVolume():int
        {
            return (_traxVolume);
        }

        public function get furniVolume():int
        {
            return (_furniVolume);
        }

        public function get uiVolume():int
        {
            return (_uiVolume);
        }

        public function get freeFlowChatDisabled():Boolean
        {
            return (_SafeStr_7140);
        }

        public function get roomInvitesIgnored():Boolean
        {
            return (_SafeStr_3760);
        }

        public function get roomCameraFollowDisabled():Boolean
        {
            return (_SafeStr_7141);
        }

        public function get uiFlags():int
        {
            return (_SafeStr_3822);
        }

        public function get preferedChatStyle():int
        {
            return (_SafeStr_3785);
        }

        public function flush():Boolean
        {
            _SafeStr_7140 = false;
            _SafeStr_7141 = false;
            _SafeStr_3822 = 0;
            _SafeStr_3785 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _uiVolume = _arg_1.readInteger();
            _furniVolume = _arg_1.readInteger();
            _traxVolume = _arg_1.readInteger();
            _SafeStr_7140 = _arg_1.readBoolean();
            _SafeStr_3760 = _arg_1.readBoolean();
            _SafeStr_7141 = _arg_1.readBoolean();
            _SafeStr_3822 = _arg_1.readInteger();
            _SafeStr_3785 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-A1o

// _SafeStr_1325 = "_-ge" (String#9432, DoABC#3)
// _SafeStr_3760 = "_-h3" (String#9485, DoABC#3)
// _SafeStr_3785 = "_-T1l" (String#8488, DoABC#3)
// _SafeStr_3822 = "_-I1Z" (String#7729, DoABC#3)
// _SafeStr_7140 = "_-y1Q" (String#10589, DoABC#3)
// _SafeStr_7141 = "_-32k" (String#6753, DoABC#3)


