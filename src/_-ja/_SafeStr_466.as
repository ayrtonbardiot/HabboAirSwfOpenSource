// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_466

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1184;

    [SecureSWF(rename="true")]
    public class _SafeStr_466 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_466(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1184);
        }

        public function getParser():_SafeStr_1184
        {
            return (this._SafeStr_7012 as _SafeStr_1184);
        }


    }
}//package _-Ja

// _SafeStr_1184 = "_-rq" (String#10169, DoABC#3)
// _SafeStr_466 = "_-BT" (String#7335, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


