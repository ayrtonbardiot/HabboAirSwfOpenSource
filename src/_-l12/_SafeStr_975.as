// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l12._SafeStr_975

package _-l12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-u1V._SafeStr_1416;

    [SecureSWF(rename="true")]
    public class _SafeStr_975 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_975(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1416);
        }

        public function getParser():_SafeStr_1416
        {
            return (this._SafeStr_7012 as _SafeStr_1416);
        }


    }
}//package _-l12

// _SafeStr_1416 = "_-DC" (String#7443, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_975 = "_-QX" (String#8323, DoABC#3)


