// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1K._SafeStr_1174

package _-Z1K
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1174 implements IMessageParser 
    {

        private var _SafeStr_7888:int;


        public function get minutesUntilClosing():int
        {
            return (_SafeStr_7888);
        }

        public function flush():Boolean
        {
            _SafeStr_7888 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7888 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-Z1K

// _SafeStr_1174 = "_-61I" (String#6944, DoABC#3)
// _SafeStr_7888 = "_-N1q" (String#8078, DoABC#3)


