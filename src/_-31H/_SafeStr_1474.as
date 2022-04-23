// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-31H._SafeStr_1474

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ja._SafeStr_1559;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1474 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1559;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1559(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1559
        {
            return (_SafeStr_3740);
        }


    }
}//package _-31H

// _SafeStr_1474 = "_-Rd" (String#8381, DoABC#3)
// _SafeStr_1559 = "_-S7" (String#8432, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


