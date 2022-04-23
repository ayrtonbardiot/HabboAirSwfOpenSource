// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81O._SafeStr_1301

package _-81O
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1301 implements IMessageParser 
    {

        private var _SafeStr_4128:int = 0;
        private var _SafeStr_7129:Boolean = false;


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get sleeping():Boolean
        {
            return (_SafeStr_7129);
        }

        public function flush():Boolean
        {
            _SafeStr_4128 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_7129 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-81O

// _SafeStr_1301 = "_-v2" (String#10406, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7129 = "_-16" (String#6591, DoABC#3)


