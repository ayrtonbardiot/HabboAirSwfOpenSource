// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-V1k._SafeStr_1497

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-x1P._SafeStr_1640;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1497 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1640;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1640(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1640
        {
            return (_SafeStr_3740);
        }


    }
}//package _-V1k

// _SafeStr_1497 = "_-M1T" (String#8002, DoABC#3)
// _SafeStr_1640 = "_-m18" (String#9793, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


