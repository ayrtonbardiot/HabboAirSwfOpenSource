// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_507

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1474;

    [SecureSWF(rename="true")]
    public class _SafeStr_507 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_507(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1474);
        }

        public function getParser():_SafeStr_1474
        {
            return (this._SafeStr_7012 as _SafeStr_1474);
        }


    }
}//package _-Ja

// _SafeStr_1474 = "_-Rd" (String#8381, DoABC#3)
// _SafeStr_507 = "_-q1U" (String#10051, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


