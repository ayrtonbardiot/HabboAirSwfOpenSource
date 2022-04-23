// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1h._SafeStr_592

package _-K1h
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-sq._SafeStr_1240;

    [SecureSWF(rename="true")]
    public class _SafeStr_592 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_592(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1240);
        }

        public function getParser():_SafeStr_1240
        {
            return (this._SafeStr_7012 as _SafeStr_1240);
        }


    }
}//package _-K1h

// _SafeStr_1240 = "_-n8" (String#9895, DoABC#3)
// _SafeStr_592 = "_-s1U" (String#10188, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


