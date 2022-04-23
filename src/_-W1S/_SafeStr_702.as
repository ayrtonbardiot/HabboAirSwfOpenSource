// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1S._SafeStr_702

package _-W1S
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-a1d._SafeStr_1362;

    [SecureSWF(rename="true")]
    public class _SafeStr_702 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_702(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1362);
        }

        public function getParser():_SafeStr_1362
        {
            return (_SafeStr_7012 as _SafeStr_1362);
        }


    }
}//package _-W1S

// _SafeStr_1362 = "_-u1E" (String#10309, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_702 = "_-1E" (String#6596, DoABC#3)


