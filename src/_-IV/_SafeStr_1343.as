// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-IV._SafeStr_1343

package _-IV
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-p1o._SafeStr_1618;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1343 implements IMessageParser 
    {

        private var _SafeStr_4764:_SafeStr_1618;


        public function flush():Boolean
        {
            _SafeStr_4764 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4764 = new _SafeStr_1618(_arg_1);
            return (true);
        }

        public function get achievement():_SafeStr_1618
        {
            return (_SafeStr_4764);
        }


    }
}//package _-IV

// _SafeStr_1343 = "_-019" (String#6470, DoABC#3)
// _SafeStr_1618 = "_-N2" (String#8084, DoABC#3)
// _SafeStr_4764 = "_-L1Z" (String#7950, DoABC#3)


