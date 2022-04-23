// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-V1k._SafeStr_1173

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-x1P._SafeStr_1568;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1173 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1568;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1568(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1568
        {
            return (_SafeStr_3740);
        }


    }
}//package _-V1k

// _SafeStr_1173 = "_-8x" (String#7147, DoABC#3)
// _SafeStr_1568 = "_-V1L" (String#8610, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


