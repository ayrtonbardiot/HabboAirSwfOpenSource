// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-sq._SafeStr_1161

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1161 implements IMessageParser 
    {

        private var _roomBeforeGame:int;


        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _roomBeforeGame = _arg_1.readInteger();
            return (true);
        }

        public function get roomBeforeGame():int
        {
            return (_roomBeforeGame);
        }


    }
}//package _-sq

// _SafeStr_1161 = "_-31m" (String#6731, DoABC#3)


