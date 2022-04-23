// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1Q._SafeStr_1349

package _-l1Q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1349 implements IMessageParser 
    {

        private var _SafeStr_7385:int = 0;


        public function get secondsRemaining():int
        {
            return (_SafeStr_7385);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7385 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-l1Q

// _SafeStr_1349 = "_-up" (String#10364, DoABC#3)
// _SafeStr_7385 = "_-a1S" (String#8974, DoABC#3)


