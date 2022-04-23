// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-n1H._SafeStr_724

package _-n1H
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Z1C._SafeStr_1050;

    [SecureSWF(rename="true")]
    public class _SafeStr_724 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_724(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1050);
        }

        public function getParser():_SafeStr_1050
        {
            return (this._SafeStr_7012 as _SafeStr_1050);
        }


    }
}//package _-n1H

// _SafeStr_1050 = "_-Cq" (String#7404, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_724 = "_-ds" (String#9250, DoABC#3)


