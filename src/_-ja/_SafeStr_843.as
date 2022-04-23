// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_843

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1082;

    [SecureSWF(rename="true")]
    public class _SafeStr_843 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_843(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1082);
        }

        public function getParser():_SafeStr_1082
        {
            return (this._SafeStr_7012 as _SafeStr_1082);
        }


    }
}//package _-Ja

// _SafeStr_1082 = "_-51j" (String#6893, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_843 = "_-W1I" (String#8669, DoABC#3)


