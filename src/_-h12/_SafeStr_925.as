// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-h12._SafeStr_925

package _-h12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Wi._SafeStr_1388;

    [SecureSWF(rename="true")]
    public class _SafeStr_925 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_925(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1388);
        }

        public function getParser():_SafeStr_1388
        {
            return (this._SafeStr_7012 as _SafeStr_1388);
        }


    }
}//package _-h12

// _SafeStr_1388 = "_-cY" (String#9148, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_925 = "_-KO" (String#7913, DoABC#3)


