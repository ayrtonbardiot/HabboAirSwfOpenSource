// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1C._SafeStr_1128

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1128 implements IMessageParser 
    {

        public static const _SafeStr_7853:int = 1;
        public static const _SafeStr_7854:int = 2;
        public static const _SafeStr_7855:int = 3;
        public static const _SafeStr_7856:int = 4;
        public static const _SafeStr_7857:int = 5;
        public static const _SafeStr_7858:int = 6;
        public static const _SafeStr_7859:int = 7;
        public static const _SafeStr_7860:int = 8;
        public static const _SafeStr_7861:int = 9;
        public static const _SafeStr_7862:int = 10;
        public static const _SafeStr_7863:int = 11;
        public static const _SafeStr_7864:int = 12;
        public static const _SafeStr_7865:int = 13;

        private var _SafeStr_3693:int;
        private var _SafeStr_7053:int;
        private var _SafeStr_7589:String;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3693 = _arg_1.readInteger();
            _SafeStr_7053 = _arg_1.readInteger();
            _SafeStr_7589 = _arg_1.readString();
            return (true);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get errorCode():int
        {
            return (_SafeStr_7053);
        }

        public function get info():String
        {
            return (_SafeStr_7589);
        }


    }
}//package _-Z1C

// _SafeStr_1128 = "_-Kc" (String#7920, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)
// _SafeStr_7589 = "_-cd" (String#9151, DoABC#3)
// _SafeStr_7853 = "_-q1c" (String#10056, DoABC#3)
// _SafeStr_7854 = "_-22m" (String#6675, DoABC#3)
// _SafeStr_7855 = "_-Jz" (String#7858, DoABC#3)
// _SafeStr_7856 = "_-T1s" (String#8496, DoABC#3)
// _SafeStr_7857 = "_-mD" (String#9823, DoABC#3)
// _SafeStr_7858 = "_-OB" (String#8172, DoABC#3)
// _SafeStr_7859 = "_-n1C" (String#9857, DoABC#3)
// _SafeStr_7860 = "_-Y1K" (String#8836, DoABC#3)
// _SafeStr_7861 = "_-11O" (String#6541, DoABC#3)
// _SafeStr_7862 = "_-A3" (String#7238, DoABC#3)
// _SafeStr_7863 = "_-c1A" (String#9106, DoABC#3)
// _SafeStr_7864 = "_-jd" (String#9647, DoABC#3)
// _SafeStr_7865 = "_-t5" (String#10272, DoABC#3)


