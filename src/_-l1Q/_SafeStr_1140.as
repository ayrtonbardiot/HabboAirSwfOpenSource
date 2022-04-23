// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1Q._SafeStr_1140

package _-l1Q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-n1H._SafeStr_1626;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1140 implements IMessageParser 
    {

        private var _SafeStr_7049:_SafeStr_1626;


        public function flush():Boolean
        {
            _SafeStr_7049 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7049 = new _SafeStr_1626(_arg_1);
            return (true);
        }

        public function get chatSettings():_SafeStr_1626
        {
            return (_SafeStr_7049);
        }


    }
}//package _-l1Q

// _SafeStr_1140 = "_-LM" (String#7969, DoABC#3)
// _SafeStr_1626 = "_-51" (String#6869, DoABC#3)
// _SafeStr_7049 = "_-FY" (String#7569, DoABC#3)


