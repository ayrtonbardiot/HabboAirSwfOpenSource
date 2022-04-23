// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1244

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1244 implements IMessageParser 
    {

        private var _SafeStr_4026:int = -1;


        public function flush():Boolean
        {
            _SafeStr_4026 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4026 = _arg_1.readInteger();
            return (true);
        }

        public function get effectId():int
        {
            return (_SafeStr_4026);
        }


    }
}//package _-61T

// _SafeStr_1244 = "_-LC" (String#7964, DoABC#3)
// _SafeStr_4026 = "_-710" (String#7008, DoABC#3)


