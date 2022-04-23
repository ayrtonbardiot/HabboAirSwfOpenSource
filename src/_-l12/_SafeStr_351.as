// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l12._SafeStr_351

package _-l12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-u1V._SafeStr_1495;

    [SecureSWF(rename="true")]
    public class _SafeStr_351 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_351(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1495);
        }

        public function getParser():_SafeStr_1495
        {
            return (this._SafeStr_7012 as _SafeStr_1495);
        }


    }
}//package _-l12

// _SafeStr_1495 = "_-G1U" (String#7597, DoABC#3)
// _SafeStr_351 = "_-11S" (String#6543, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


