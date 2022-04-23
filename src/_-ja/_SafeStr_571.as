// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_571

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1293;

    [SecureSWF(rename="true")]
    public class _SafeStr_571 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_571(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1293);
        }

        public function getParser():_SafeStr_1293
        {
            return (this._SafeStr_7012 as _SafeStr_1293);
        }


    }
}//package _-Ja

// _SafeStr_1293 = "_-315" (String#6713, DoABC#3)
// _SafeStr_571 = "_-X11" (String#8764, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


