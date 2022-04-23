// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Y1i._SafeStr_1145

package _-Y1i
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-v1p._SafeStr_1636;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1145 implements IMessageParser 
    {

        private var _SafeStr_7593:int = -1;
        private var _SafeStr_5004:int = -1;
        private var _SafeStr_7789:_SafeStr_1636;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7593 = _arg_1.readInteger();
            _SafeStr_5004 = _arg_1.readInteger();
            _SafeStr_7789 = new _SafeStr_1636(_arg_1);
            return (true);
        }

        public function get issueId():int
        {
            return (_SafeStr_7593);
        }

        public function get accountId():int
        {
            return (_SafeStr_5004);
        }

        public function get sanctionType():_SafeStr_1636
        {
            return (_SafeStr_7789);
        }

        public function flush():Boolean
        {
            _SafeStr_7593 = -1;
            _SafeStr_5004 = -1;
            _SafeStr_7789 = null;
            return (true);
        }


    }
}//package _-Y1i

// _SafeStr_1145 = "_-k1h" (String#9683, DoABC#3)
// _SafeStr_1636 = "_-iU" (String#9561, DoABC#3)
// _SafeStr_5004 = "_-pZ" (String#10013, DoABC#3)
// _SafeStr_7593 = "_-fe" (String#9372, DoABC#3)
// _SafeStr_7789 = "_-8P" (String#7127, DoABC#3)


