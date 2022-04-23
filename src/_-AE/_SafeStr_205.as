// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_205

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1206;

    [SecureSWF(rename="true")]
    public class _SafeStr_205 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_205(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1206);
        }

        public function getParser():_SafeStr_1206
        {
            return (this._SafeStr_7012 as _SafeStr_1206);
        }


    }
}//package _-AE

// _SafeStr_1206 = "_-gl" (String#9436, DoABC#3)
// _SafeStr_205 = "_-d1c" (String#9185, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


