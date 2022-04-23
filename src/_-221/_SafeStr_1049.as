// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-221._SafeStr_1049

package _-221
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1049 implements IMessageParser 
    {

        public static const _SafeStr_7021:int = 1;

        private var _SafeStr_4128:int;
        private var _SafeStr_7022:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_7022 = _arg_1.readInteger();
            return (true);
        }

        public function get userID():int
        {
            return (_SafeStr_4128);
        }

        public function get reason():int
        {
            return (_SafeStr_7022);
        }


    }
}//package _-221

// _SafeStr_1049 = "_-o1S" (String#9930, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7021 = "_-QU" (String#8320, DoABC#3)
// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)


