// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Eh._SafeStr_1631

package _-Eh
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1631 
    {

        public static const _SafeStr_7212:int = 0;
        public static const _SafeStr_7213:int = 1;
        public static const _SafeStr_7214:int = 2;

        private var _SafeStr_3820:int;
        private var _SafeStr_4004:String;
        private var _SafeStr_7215:String;
        private var _SafeStr_7216:String;
        private var _SafeStr_7217:int;
        private var _SafeStr_7218:String;
        private var _SafeStr_4295:String;

        public function _SafeStr_1631(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_4004 = _arg_1.readString();
            _SafeStr_7215 = _arg_1.readString();
            _SafeStr_7216 = _arg_1.readString();
            _SafeStr_7217 = _arg_1.readInteger();
            _SafeStr_7218 = _arg_1.readString();
            _SafeStr_4295 = _arg_1.readString();
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get title():String
        {
            return (_SafeStr_4004);
        }

        public function get bodyText():String
        {
            return (_SafeStr_7215);
        }

        public function get buttonText():String
        {
            return (_SafeStr_7216);
        }

        public function get linkType():int
        {
            return (_SafeStr_7217);
        }

        public function get linkContent():String
        {
            return (_SafeStr_7218);
        }

        public function get imageUrl():String
        {
            return (_SafeStr_4295);
        }


    }
}//package _-Eh

// _SafeStr_1631 = "_-91" (String#7149, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4004 = "_-41o" (String#6832, DoABC#3)
// _SafeStr_4295 = "_-GL" (String#7628, DoABC#3)
// _SafeStr_7212 = "_-y1L" (String#10585, DoABC#3)
// _SafeStr_7213 = "_-YI" (String#8866, DoABC#3)
// _SafeStr_7214 = "_-T6" (String#8506, DoABC#3)
// _SafeStr_7215 = "_-I1V" (String#7727, DoABC#3)
// _SafeStr_7216 = "_-D0" (String#7411, DoABC#3)
// _SafeStr_7217 = "_-Ce" (String#7400, DoABC#3)
// _SafeStr_7218 = "_-j1i" (String#9606, DoABC#3)


