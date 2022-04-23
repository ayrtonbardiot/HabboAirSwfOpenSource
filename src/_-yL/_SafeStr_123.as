// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-yL._SafeStr_123

package _-yL
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-K1r._SafeStr_1366;

    [SecureSWF(rename="true")]
    public class _SafeStr_123 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_123(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1366);
        }

        public function get noobnessLevel():int
        {
            return ((this._SafeStr_7012 as _SafeStr_1366).noobnessLevel);
        }


    }
}//package _-yL

// _SafeStr_123 = "_-zA" (String#10683, DoABC#3)
// _SafeStr_1366 = "_-D1r" (String#7436, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


