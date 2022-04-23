// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-q1B._SafeStr_839

package _-q1B
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-71X._SafeStr_1410;

    [SecureSWF(rename="true")]
    public class _SafeStr_839 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_839(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1410);
        }

        public function getParser():_SafeStr_1410
        {
            return (this._SafeStr_7012 as _SafeStr_1410);
        }


    }
}//package _-q1B

// _SafeStr_1410 = "_-4i" (String#6861, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_839 = "_-uH" (String#10345, DoABC#3)


