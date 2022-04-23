// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_703

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1424;

    [SecureSWF(rename="true")]
    public class _SafeStr_703 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_703(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1424);
        }

        public function getParser():_SafeStr_1424
        {
            return (this._SafeStr_7012 as _SafeStr_1424);
        }


    }
}//package _-Ja

// _SafeStr_1424 = "_-RL" (String#8373, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_703 = "_-q16" (String#10034, DoABC#3)


