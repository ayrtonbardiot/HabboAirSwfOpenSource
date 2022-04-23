// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_128

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1486;

    [SecureSWF(rename="true")]
    public class _SafeStr_128 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_128(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1486);
        }

        public function getParser():_SafeStr_1486
        {
            return (this._SafeStr_7012 as _SafeStr_1486);
        }


    }
}//package _-Ja

// _SafeStr_128 = "_-G1b" (String#7600, DoABC#3)
// _SafeStr_1486 = "_-3O" (String#6773, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


