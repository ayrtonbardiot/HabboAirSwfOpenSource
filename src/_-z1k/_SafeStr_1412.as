// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-z1k._SafeStr_1412

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1412 implements IMessageParser 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_4525:int;


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get value():int
        {
            return (_SafeStr_4525);
        }

        public function flush():Boolean
        {
            _SafeStr_3820 = -1;
            _SafeStr_4525 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_4525 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1412 = "_-vs" (String#10428, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4525 = "_-8S" (String#7130, DoABC#3)


