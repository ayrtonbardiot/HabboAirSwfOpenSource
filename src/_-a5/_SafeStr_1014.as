// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-a5._SafeStr_1014

package _-a5
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Z1K._SafeStr_1428;

    [SecureSWF(rename="true")]
    public class _SafeStr_1014 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_1014(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1428);
        }

        public function getParser():_SafeStr_1428
        {
            return (_SafeStr_7012 as _SafeStr_1428);
        }


    }
}//package _-a5

// _SafeStr_1014 = "_-X8" (String#8795, DoABC#3)
// _SafeStr_1428 = "_-01D" (String#6473, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


