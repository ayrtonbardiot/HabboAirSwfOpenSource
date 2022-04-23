// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1S._SafeStr_956

package _-W1S
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-a1d._SafeStr_1268;

    [SecureSWF(rename="true")]
    public class _SafeStr_956 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_956(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1268);
        }

        public function getParser():_SafeStr_1268
        {
            return (_SafeStr_7012 as _SafeStr_1268);
        }


    }
}//package _-W1S

// _SafeStr_1268 = "_-me" (String#9837, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_956 = "_-j3" (String#9614, DoABC#3)


