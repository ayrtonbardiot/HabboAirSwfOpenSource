// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1C._SafeStr_1290

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1290 implements IMessageParser 
    {

        private var _SafeStr_7866:Boolean;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7866 = _arg_1.readBoolean();
            return (true);
        }

        public function get allMuted():Boolean
        {
            return (_SafeStr_7866);
        }

        public function flush():Boolean
        {
            return (true);
        }


    }
}//package _-Z1C

// _SafeStr_1290 = "_-l1B" (String#9736, DoABC#3)
// _SafeStr_7866 = "_-UI" (String#8576, DoABC#3)


