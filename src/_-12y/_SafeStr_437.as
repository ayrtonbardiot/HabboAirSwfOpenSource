// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-12y._SafeStr_437

package _-12y
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-kx._SafeStr_1117;

    [SecureSWF(rename="true")]
    public class _SafeStr_437 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_437(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1117);
        }

        public function getParser():_SafeStr_1117
        {
            return (this._SafeStr_7012 as _SafeStr_1117);
        }


    }
}//package _-12y

// _SafeStr_1117 = "_-T1q" (String#8495, DoABC#3)
// _SafeStr_437 = "_-B1m" (String#7319, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


