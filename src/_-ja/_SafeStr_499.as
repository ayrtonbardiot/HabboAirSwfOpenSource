// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_499

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1059;

    [SecureSWF(rename="true")]
    public class _SafeStr_499 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_499(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1059);
        }

        public function getParser():_SafeStr_1059
        {
            return (this._SafeStr_7012 as _SafeStr_1059);
        }


    }
}//package _-Ja

// _SafeStr_1059 = "_-m1H" (String#9798, DoABC#3)
// _SafeStr_499 = "_-s1j" (String#10197, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


