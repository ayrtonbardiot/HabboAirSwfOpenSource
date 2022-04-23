// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-R7._SafeStr_214

package _-R7
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-A1o._SafeStr_1325;

    [SecureSWF(rename="true")]
    public class _SafeStr_214 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_214(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1325);
        }

        public function getParser():_SafeStr_1325
        {
            return (this._SafeStr_7012 as _SafeStr_1325);
        }


    }
}//package _-R7

// _SafeStr_1325 = "_-ge" (String#9432, DoABC#3)
// _SafeStr_214 = "_-h1u" (String#9481, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


