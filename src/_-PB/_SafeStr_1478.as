// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-PB._SafeStr_1478

package _-PB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1478 implements IMessageParser 
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
}//package _-PB

// _SafeStr_1478 = "_-If" (String#7756, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)


