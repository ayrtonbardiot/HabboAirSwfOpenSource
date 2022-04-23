// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Y1i._SafeStr_1504

package _-Y1i
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1504 implements IMessageParser 
    {

        private var _SafeStr_7790:Boolean;
        private var _SafeStr_7791:Boolean;
        private var _SafeStr_7792:String;
        private var _SafeStr_7793:int;
        private var _SafeStr_7794:String;
        private var _SafeStr_7795:String;
        private var _SafeStr_7796:int;
        private var _SafeStr_7797:String;
        private var _SafeStr_7798:int;
        private var _SafeStr_7799:Boolean;
        private var _SafeStr_7800:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7790 = _arg_1.readBoolean();
            _SafeStr_7791 = _arg_1.readBoolean();
            _SafeStr_7792 = _arg_1.readString();
            _SafeStr_7793 = _arg_1.readInteger();
            _arg_1.readInteger();
            _SafeStr_7794 = _arg_1.readString();
            _SafeStr_7795 = _arg_1.readString();
            _SafeStr_7796 = _arg_1.readInteger();
            _SafeStr_7797 = _arg_1.readString();
            _SafeStr_7798 = _arg_1.readInteger();
            _arg_1.readInteger();
            _SafeStr_7799 = _arg_1.readBoolean();
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_7800 = _arg_1.readString();
            };
            return (true);
        }

        public function get isSanctionNew():Boolean
        {
            return (_SafeStr_7790);
        }

        public function get isSanctionActive():Boolean
        {
            return (_SafeStr_7791);
        }

        public function get sanctionName():String
        {
            return (_SafeStr_7792);
        }

        public function get sanctionLengthHours():int
        {
            return (_SafeStr_7793);
        }

        public function get sanctionReason():String
        {
            return (_SafeStr_7794);
        }

        public function get sanctionCreationTime():String
        {
            return (_SafeStr_7795);
        }

        public function get probationHoursLeft():int
        {
            return (_SafeStr_7796);
        }

        public function get nextSanctionName():String
        {
            return (_SafeStr_7797);
        }

        public function get nextSanctionLengthHours():int
        {
            return (_SafeStr_7798);
        }

        public function get hasCustomMute():Boolean
        {
            return (_SafeStr_7799);
        }

        public function get tradeLockExpiryTime():String
        {
            return (_SafeStr_7800);
        }


    }
}//package _-Y1i

// _SafeStr_1504 = "_-at" (String#9031, DoABC#3)
// _SafeStr_7790 = "_-m1R" (String#9803, DoABC#3)
// _SafeStr_7791 = "_-11a" (String#6548, DoABC#3)
// _SafeStr_7792 = "_-X13" (String#8765, DoABC#3)
// _SafeStr_7793 = "_-3c" (String#6783, DoABC#3)
// _SafeStr_7794 = "_-w1r" (String#10466, DoABC#3)
// _SafeStr_7795 = "_-o1o" (String#9937, DoABC#3)
// _SafeStr_7796 = "_-dU" (String#9240, DoABC#3)
// _SafeStr_7797 = "_-rK" (String#10153, DoABC#3)
// _SafeStr_7798 = "_-mf" (String#9838, DoABC#3)
// _SafeStr_7799 = "_-A1z" (String#7237, DoABC#3)
// _SafeStr_7800 = "_-O1j" (String#8158, DoABC#3)


