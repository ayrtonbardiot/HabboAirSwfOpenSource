// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81g._SafeStr_670

package _-81g
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-z1k._SafeStr_1246;

    [SecureSWF(rename="true")]
    public class _SafeStr_670 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_670(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1246);
        }

        public function getParser():_SafeStr_1246
        {
            return (_SafeStr_7012 as _SafeStr_1246);
        }


    }
}//package _-81g

// _SafeStr_1246 = "_-uA" (String#10340, DoABC#3)
// _SafeStr_670 = "_-Ia" (String#7754, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


