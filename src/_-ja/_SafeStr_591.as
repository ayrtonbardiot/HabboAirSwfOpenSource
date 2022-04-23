// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_591

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1085;

    [SecureSWF(rename="true")]
    public class _SafeStr_591 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_591(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1085);
        }

        public function getParser():_SafeStr_1085
        {
            return (this._SafeStr_7012 as _SafeStr_1085);
        }


    }
}//package _-Ja

// _SafeStr_1085 = "_-Jf" (String#7848, DoABC#3)
// _SafeStr_591 = "_-S1g" (String#8415, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


