// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-JS._SafeStr_1007

package _-JS
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-wm._SafeStr_1350;

    [SecureSWF(rename="true")]
    public class _SafeStr_1007 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_1007(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1350);
        }

        public function getParser():_SafeStr_1350
        {
            return (this._SafeStr_7012 as _SafeStr_1350);
        }


    }
}//package _-JS

// _SafeStr_1007 = "_-gH" (String#9422, DoABC#3)
// _SafeStr_1350 = "_-Ie" (String#7755, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


