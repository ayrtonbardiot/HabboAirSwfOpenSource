// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-sq._SafeStr_1047

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1047 implements IMessageParser 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_7521:int;


        public function flush():Boolean
        {
            _SafeStr_4128 = NaN;
            _SafeStr_7521 = NaN;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_7521 = _arg_1.readInteger();
            return (true);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get playerGameObjectId():int
        {
            return (_SafeStr_7521);
        }


    }
}//package _-sq

// _SafeStr_1047 = "_-Z4" (String#8927, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7521 = "_-Hh" (String#7706, DoABC#3)


