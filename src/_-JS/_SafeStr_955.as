// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-JS._SafeStr_955

package _-JS
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-wm._SafeStr_1330;

    [SecureSWF(rename="true")]
    public class _SafeStr_955 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_955(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1330);
        }

        public function getParser():_SafeStr_1330
        {
            return (_SafeStr_7012 as _SafeStr_1330);
        }


    }
}//package _-JS

// _SafeStr_1330 = "_-SS" (String#8446, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_955 = "_-H15" (String#7658, DoABC#3)


