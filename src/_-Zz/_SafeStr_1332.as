// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Zz._SafeStr_1332

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1332 implements IMessageParser 
    {

        public static const _SafeStr_7391:int = 1;
        public static const _SafeStr_7392:int = 2;
        public static const _SafeStr_7895:int = 3;

        private var _SafeStr_3734:int;
        private var _SafeStr_5612:int;
        private var _SafeStr_5613:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3734 = _arg_1.readInteger();
            _SafeStr_5612 = _arg_1.readInteger();
            _SafeStr_5613 = _arg_1.readInteger();
            return (true);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get ownPetId():int
        {
            return (_SafeStr_5612);
        }

        public function get otherPetId():int
        {
            return (_SafeStr_5613);
        }


    }
}//package _-Zz

// _SafeStr_1332 = "_-2Z" (String#6697, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_5612 = "_-Wa" (String#8746, DoABC#3)
// _SafeStr_5613 = "_-H1h" (String#7675, DoABC#3)
// _SafeStr_7391 = "_-Yr" (String#8880, DoABC#3)
// _SafeStr_7392 = "_-cR" (String#9143, DoABC#3)
// _SafeStr_7895 = "_-f1R" (String#9335, DoABC#3)


