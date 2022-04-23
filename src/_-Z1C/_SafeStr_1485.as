// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1C._SafeStr_1485

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1485 implements IMessageParser 
    {

        private var _SafeStr_7868:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7868 = _arg_1.readInteger();
            return (true);
        }

        public function get selectionType():int
        {
            return (_SafeStr_7868);
        }


    }
}//package _-Z1C

// _SafeStr_1485 = "_-vb" (String#10420, DoABC#3)
// _SafeStr_7868 = "_-D1F" (String#7420, DoABC#3)


