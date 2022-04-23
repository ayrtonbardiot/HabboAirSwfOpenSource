// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-JS._SafeStr_576

package _-JS
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-wm._SafeStr_1415;

    [SecureSWF(rename="true")]
    public class _SafeStr_576 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_576(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1415);
        }

        public function get success():Boolean
        {
            return (_SafeStr_1415(_SafeStr_7012).success);
        }


    }
}//package _-JS

// _SafeStr_1415 = "_-91Z" (String#7168, DoABC#3)
// _SafeStr_576 = "_-eM" (String#9303, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


