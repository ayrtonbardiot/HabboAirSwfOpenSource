// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-h12._SafeStr_275

package _-h12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Wi._SafeStr_1414;

    [SecureSWF(rename="true")]
    public class _SafeStr_275 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_275(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1414);
        }

        public function getParser():_SafeStr_1414
        {
            return (this._SafeStr_7012 as _SafeStr_1414);
        }


    }
}//package _-h12

// _SafeStr_1414 = "_-c1g" (String#9121, DoABC#3)
// _SafeStr_275 = "_-DY" (String#7452, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


