// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_148

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1072;

    [SecureSWF(rename="true")]
    public class _SafeStr_148 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_148(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1072);
        }

        public function getParser():_SafeStr_1072
        {
            return (this._SafeStr_7012 as _SafeStr_1072);
        }


    }
}//package _-AE

// _SafeStr_1072 = "_-iS" (String#9560, DoABC#3)
// _SafeStr_148 = "_-l6" (String#9764, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


