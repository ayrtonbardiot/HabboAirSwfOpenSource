// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61Z._SafeStr_1508

package _-61Z
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1508 implements IMessageParser 
    {

        private var _SafeStr_7007:int;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7007 = _arg_1.readInteger();
            return (true);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function get stripId():int
        {
            return (_SafeStr_7007);
        }


    }
}//package _-61Z

// _SafeStr_1508 = "_-z1O" (String#10659, DoABC#3)
// _SafeStr_7007 = "_-J1n" (String#7783, DoABC#3)


