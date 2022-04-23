// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ol._SafeStr_530

package _-Ol
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-61T._SafeStr_1248;

    [SecureSWF(rename="true")]
    public class _SafeStr_530 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_530(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1248);
        }

        public function getParser():_SafeStr_1248
        {
            return (_SafeStr_7012 as _SafeStr_1248);
        }


    }
}//package _-Ol

// _SafeStr_1248 = "_-mE" (String#9824, DoABC#3)
// _SafeStr_530 = "_-sr" (String#10236, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


