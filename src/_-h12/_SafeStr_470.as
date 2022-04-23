// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-h12._SafeStr_470

package _-h12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Wi._SafeStr_1114;

    [SecureSWF(rename="true")]
    public class _SafeStr_470 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_470(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1114);
        }

        public function getParser():_SafeStr_1114
        {
            return (this._SafeStr_7012 as _SafeStr_1114);
        }


    }
}//package _-h12

// _SafeStr_1114 = "_-V1p" (String#8629, DoABC#3)
// _SafeStr_470 = "_-22o" (String#6677, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


