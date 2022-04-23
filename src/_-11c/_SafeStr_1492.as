// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-11c._SafeStr_1492

package _-11c
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1492 implements IMessageParser 
    {

        private var _SafeStr_7007:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7007 = _arg_1.readInteger();
            return (true);
        }

        public function get itemId():int
        {
            return (_SafeStr_7007);
        }


    }
}//package _-11c

// _SafeStr_1492 = "_-D1l" (String#7433, DoABC#3)
// _SafeStr_7007 = "_-J1n" (String#7783, DoABC#3)


