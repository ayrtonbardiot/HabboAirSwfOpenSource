// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l12._SafeStr_319

package _-l12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-u1V._SafeStr_1078;

    [SecureSWF(rename="true")]
    public class _SafeStr_319 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_319(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1078);
        }

        public function getParser():_SafeStr_1078
        {
            return (this._SafeStr_7012 as _SafeStr_1078);
        }


    }
}//package _-l12

// _SafeStr_1078 = "_-Jo" (String#7853, DoABC#3)
// _SafeStr_319 = "_-y1n" (String#10598, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


