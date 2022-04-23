// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-qg._SafeStr_559

package _-qg
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Lc._SafeStr_1355;

    [SecureSWF(rename="true")]
    public class _SafeStr_559 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_559(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1355);
        }

        public function getParser():_SafeStr_1355
        {
            return (_SafeStr_7012 as _SafeStr_1355);
        }


    }
}//package _-qg

// _SafeStr_1355 = "_-Q1s" (String#8301, DoABC#3)
// _SafeStr_559 = "_-9K" (String#7189, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


