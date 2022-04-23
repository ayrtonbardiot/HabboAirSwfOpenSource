// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-n1H._SafeStr_997

package _-n1H
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Z1C._SafeStr_1329;

    [SecureSWF(rename="true")]
    public class _SafeStr_997 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_997(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1329);
        }

        public function getParser():_SafeStr_1329
        {
            return (this._SafeStr_7012 as _SafeStr_1329);
        }


    }
}//package _-n1H

// _SafeStr_1329 = "_-w17" (String#10439, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_997 = "_-h17" (String#9457, DoABC#3)


