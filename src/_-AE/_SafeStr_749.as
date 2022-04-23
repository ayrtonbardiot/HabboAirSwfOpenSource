// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_749

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1144;

    [SecureSWF(rename="true")]
    public class _SafeStr_749 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_749(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1144);
        }

        public function getParser():_SafeStr_1144
        {
            return (this._SafeStr_7012 as _SafeStr_1144);
        }


    }
}//package _-AE

// _SafeStr_1144 = "_-01y" (String#6498, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_749 = "_-i1a" (String#9534, DoABC#3)


