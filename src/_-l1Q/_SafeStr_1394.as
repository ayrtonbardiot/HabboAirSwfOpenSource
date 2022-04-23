// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1Q._SafeStr_1394

package _-l1Q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1394 implements IMessageParser 
    {

        private var _SafeStr_4128:int = 0;
        private var _SafeStr_5030:Boolean = false;


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get isTyping():Boolean
        {
            return (_SafeStr_5030);
        }

        public function flush():Boolean
        {
            _SafeStr_4128 = 0;
            _SafeStr_5030 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_5030 = (_arg_1.readInteger() == 1);
            return (true);
        }


    }
}//package _-l1Q

// _SafeStr_1394 = "_-W1e" (String#8717, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_5030 = "_-KT" (String#7916, DoABC#3)


