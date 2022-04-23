// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-ja._SafeStr_271

package _-ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-QB._SafeStr_1433;

    [SecureSWF(rename="true")]
    public class _SafeStr_271 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_271(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1433);
        }

        public function getParser():_SafeStr_1433
        {
            return (_SafeStr_7012 as _SafeStr_1433);
        }


    }
}//package _-ja

// _SafeStr_1433 = "_-e13" (String#9264, DoABC#3)
// _SafeStr_271 = "_-wI" (String#10477, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


