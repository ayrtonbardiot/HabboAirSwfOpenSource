// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-ja._SafeStr_864

package _-ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-QB._SafeStr_1411;

    [SecureSWF(rename="true")]
    public class _SafeStr_864 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_864(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1411);
        }

        public function getParser():_SafeStr_1411
        {
            return (_SafeStr_7012 as _SafeStr_1411);
        }


    }
}//package _-ja

// _SafeStr_1411 = "_-v1k" (String#10393, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_864 = "_-j1" (String#9581, DoABC#3)


