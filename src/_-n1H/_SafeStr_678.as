// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-n1H._SafeStr_678

package _-n1H
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Z1C._SafeStr_1110;

    [SecureSWF(rename="true")]
    public class _SafeStr_678 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_678(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1110);
        }

        public function getParser():_SafeStr_1110
        {
            return (this._SafeStr_7012 as _SafeStr_1110);
        }


    }
}//package _-n1H

// _SafeStr_1110 = "_-Fl" (String#7578, DoABC#3)
// _SafeStr_678 = "_-32B" (String#6739, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


