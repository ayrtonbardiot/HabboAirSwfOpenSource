// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-jK._SafeStr_720

package _-jK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-cP._SafeStr_1403;

    [SecureSWF(rename="true")]
    public class _SafeStr_720 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_720(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1403);
        }

        public function getParser():_SafeStr_1403
        {
            return (this._SafeStr_7012 as _SafeStr_1403);
        }


    }
}//package _-jK

// _SafeStr_1403 = "_-13" (String#6590, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_720 = "_-Sc" (String#8452, DoABC#3)


