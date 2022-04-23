// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wm._SafeStr_1415

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1415 implements IMessageParser 
    {

        private var _SafeStr_5449:Boolean;


        public function get success():Boolean
        {
            return (_SafeStr_5449);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5449 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-wm

// _SafeStr_1415 = "_-91Z" (String#7168, DoABC#3)
// _SafeStr_5449 = "_-od" (String#9957, DoABC#3)


