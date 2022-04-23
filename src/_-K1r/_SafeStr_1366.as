// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1r._SafeStr_1366

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1366 implements IMessageParser 
    {

        private var _SafeStr_3817:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3817 = _arg_1.readInteger();
            return (true);
        }

        public function get noobnessLevel():int
        {
            return (_SafeStr_3817);
        }


    }
}//package _-K1r

// _SafeStr_1366 = "_-D1r" (String#7436, DoABC#3)
// _SafeStr_3817 = "_-g1l" (String#9405, DoABC#3)


