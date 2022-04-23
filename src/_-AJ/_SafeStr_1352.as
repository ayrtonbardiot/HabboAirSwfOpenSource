// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AJ._SafeStr_1352

package _-AJ
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1352 implements IMessageParser 
    {

        private var _SafeStr_7171:Boolean;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7171 = _arg_1.readBoolean();
            return (true);
        }

        public function get acknowledged():Boolean
        {
            return (_SafeStr_7171);
        }


    }
}//package _-AJ

// _SafeStr_1352 = "_-22u" (String#6681, DoABC#3)
// _SafeStr_7171 = "_-M1i" (String#8012, DoABC#3)


