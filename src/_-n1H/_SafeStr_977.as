// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-n1H._SafeStr_977

package _-n1H
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Z1C._SafeStr_1313;

    [SecureSWF(rename="true")]
    public class _SafeStr_977 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_977(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1313);
        }

        public function getParser():_SafeStr_1313
        {
            return (this._SafeStr_7012 as _SafeStr_1313);
        }


    }
}//package _-n1H

// _SafeStr_1313 = "_-O1K" (String#8139, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_977 = "_-Wo" (String#8755, DoABC#3)


