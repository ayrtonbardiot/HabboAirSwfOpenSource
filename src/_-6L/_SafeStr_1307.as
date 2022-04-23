// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-6L._SafeStr_1307

package _-6L
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1307 implements IMessageParser 
    {

        private var _SafeStr_7053:int;


        public function get errorCode():int
        {
            return (_SafeStr_7053);
        }

        public function flush():Boolean
        {
            _SafeStr_7053 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_7053 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-6L

// _SafeStr_1307 = "_-G1j" (String#7606, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)


