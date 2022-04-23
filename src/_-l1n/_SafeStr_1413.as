// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1n._SafeStr_1413

package _-l1n
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1413 implements IMessageParser 
    {

        private var _SafeStr_4128:int = 0;
        private var _SafeStr_4525:int = 0;


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get value():int
        {
            return (_SafeStr_4525);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_4525 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-l1n

// _SafeStr_1413 = "_-6p" (String#7001, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_4525 = "_-8S" (String#7130, DoABC#3)


