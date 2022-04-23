// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-jK._SafeStr_369

package _-jK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-cP._SafeStr_1309;

    [SecureSWF(rename="true")]
    public class _SafeStr_369 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_369(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1309);
        }

        public function getParser():_SafeStr_1309
        {
            return (this._SafeStr_7012 as _SafeStr_1309);
        }


    }
}//package _-jK

// _SafeStr_1309 = "_-k1b" (String#9678, DoABC#3)
// _SafeStr_369 = "_-ar" (String#9030, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


