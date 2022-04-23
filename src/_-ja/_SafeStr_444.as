// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_444

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1303;

    [SecureSWF(rename="true")]
    public class _SafeStr_444 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_444(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1303);
        }

        public function getParser():_SafeStr_1303
        {
            return (this._SafeStr_7012 as _SafeStr_1303);
        }


    }
}//package _-Ja

// _SafeStr_1303 = "_-bd" (String#9089, DoABC#3)
// _SafeStr_444 = "_-l5" (String#9763, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


