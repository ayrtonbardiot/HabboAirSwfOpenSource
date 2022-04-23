// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-h12._SafeStr_735

package _-h12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Wi._SafeStr_1387;

    [SecureSWF(rename="true")]
    public class _SafeStr_735 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_735(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1387);
        }

        public function getParser():_SafeStr_1387
        {
            return (this._SafeStr_7012 as _SafeStr_1387);
        }


    }
}//package _-h12

// _SafeStr_1387 = "_-b1" (String#9036, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_735 = "_-s1V" (String#10189, DoABC#3)


