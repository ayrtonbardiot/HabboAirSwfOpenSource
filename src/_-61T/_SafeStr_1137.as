// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1137

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1137 implements IMessageParser 
    {

        private var _SafeStr_7007:int = 0;
        private var _SafeStr_7103:int = -1;


        public function get itemId():int
        {
            return (_SafeStr_7007);
        }

        public function get pickerId():int
        {
            return (_SafeStr_7103);
        }

        public function flush():Boolean
        {
            _SafeStr_7007 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_7007 = _arg_1.readString();
            _SafeStr_7103 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1137 = "_-33" (String#6762, DoABC#3)
// _SafeStr_7007 = "_-J1n" (String#7783, DoABC#3)
// _SafeStr_7103 = "_-21v" (String#6654, DoABC#3)


