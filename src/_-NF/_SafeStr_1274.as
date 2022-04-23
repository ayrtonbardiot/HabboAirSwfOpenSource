// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1274

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1274 implements IMessageParser 
    {

        public static const _SafeStr_7442:int = 1;
        public static const _SafeStr_7443:int = 2;
        public static const _SafeStr_7444:int = 3;
        public static const _SafeStr_7445:int = 4;

        private var _productName:String;
        private var _SafeStr_7446:int;
        private var _SafeStr_7447:int;
        private var _SafeStr_7448:int;
        private var _SafeStr_7449:int;
        private var _SafeStr_7450:Boolean;
        private var _SafeStr_4141:Boolean;
        private var _SafeStr_4265:int;
        private var _SafeStr_4266:int;
        private var _minutesUntilExpiration:int;
        private var _SafeStr_4143:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _productName = _arg_1.readString();
            _SafeStr_7446 = _arg_1.readInteger();
            _SafeStr_7447 = _arg_1.readInteger();
            _SafeStr_7448 = _arg_1.readInteger();
            _SafeStr_7449 = _arg_1.readInteger();
            _SafeStr_7450 = _arg_1.readBoolean();
            _SafeStr_4141 = _arg_1.readBoolean();
            _SafeStr_4265 = _arg_1.readInteger();
            _SafeStr_4266 = _arg_1.readInteger();
            _minutesUntilExpiration = _arg_1.readInteger();
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_4143 = _arg_1.readInteger();
            };
            return (true);
        }

        public function get productName():String
        {
            return (_productName);
        }

        public function get daysToPeriodEnd():int
        {
            return (_SafeStr_7446);
        }

        public function get memberPeriods():int
        {
            return (_SafeStr_7447);
        }

        public function get periodsSubscribedAhead():int
        {
            return (_SafeStr_7448);
        }

        public function get responseType():int
        {
            return (_SafeStr_7449);
        }

        public function get hasEverBeenMember():Boolean
        {
            return (_SafeStr_7450);
        }

        public function get isVIP():Boolean
        {
            return (_SafeStr_4141);
        }

        public function get pastClubDays():int
        {
            return (_SafeStr_4265);
        }

        public function get pastVipDays():int
        {
            return (_SafeStr_4266);
        }

        public function get minutesUntilExpiration():int
        {
            return (_minutesUntilExpiration);
        }

        public function get minutesSinceLastModified():int
        {
            return (_SafeStr_4143);
        }


    }
}//package _-NF

// _SafeStr_1274 = "_-I1o" (String#7734, DoABC#3)
// _SafeStr_4141 = "_-Jm" (String#7852, DoABC#3)
// _SafeStr_4143 = "_-C1l" (String#7371, DoABC#3)
// _SafeStr_4265 = "_-8F" (String#7120, DoABC#3)
// _SafeStr_4266 = "_-eQ" (String#9306, DoABC#3)
// _SafeStr_7442 = "_-r1m" (String#10138, DoABC#3)
// _SafeStr_7443 = "_-Zo" (String#8949, DoABC#3)
// _SafeStr_7444 = "_-Ms" (String#8043, DoABC#3)
// _SafeStr_7445 = "_-kA" (String#9696, DoABC#3)
// _SafeStr_7446 = "_-tC" (String#10276, DoABC#3)
// _SafeStr_7447 = "_-V15" (String#8602, DoABC#3)
// _SafeStr_7448 = "_-p1z" (String#10001, DoABC#3)
// _SafeStr_7449 = "_-aD" (String#9010, DoABC#3)
// _SafeStr_7450 = "_-e1f" (String#9280, DoABC#3)


