// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_692

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1113;

    [SecureSWF(rename="true")]
    public class _SafeStr_692 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_692(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1113);
        }

        public function getParser():_SafeStr_1113
        {
            return (this._SafeStr_7012 as _SafeStr_1113);
        }


    }
}//package _-AE

// _SafeStr_1113 = "_-H1P" (String#7668, DoABC#3)
// _SafeStr_692 = "_-41f" (String#6827, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


