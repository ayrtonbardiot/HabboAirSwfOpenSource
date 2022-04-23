// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-h12._SafeStr_590

package _-h12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Wi._SafeStr_1157;

    [SecureSWF(rename="true")]
    public class _SafeStr_590 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_590(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1157);
        }

        public function getParser():_SafeStr_1157
        {
            return (this._SafeStr_7012 as _SafeStr_1157);
        }


    }
}//package _-h12

// _SafeStr_1157 = "_-A1R" (String#7223, DoABC#3)
// _SafeStr_590 = "_-615" (String#6939, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


