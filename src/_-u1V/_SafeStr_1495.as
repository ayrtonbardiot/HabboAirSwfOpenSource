// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-u1V._SafeStr_1495

package _-u1V
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-l12._SafeStr_1592;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1495 implements IMessageParser 
    {

        private var _SafeStr_7588:_SafeStr_1592;


        public function flush():Boolean
        {
            _SafeStr_7588 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7588 = new _SafeStr_1592(_arg_1);
            return (true);
        }

        public function get def():_SafeStr_1592
        {
            return (_SafeStr_7588);
        }


    }
}//package _-u1V

// _SafeStr_1495 = "_-G1U" (String#7597, DoABC#3)
// _SafeStr_1592 = "_-22A" (String#6661, DoABC#3)
// _SafeStr_7588 = "_-7p" (String#7059, DoABC#3)


