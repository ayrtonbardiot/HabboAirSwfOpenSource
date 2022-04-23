// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Go._SafeStr_216

package _-Go
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-61Z._SafeStr_1444;

    [SecureSWF(rename="true")]
    public class _SafeStr_216 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_216(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1444);
        }

        public function getParser():_SafeStr_1444
        {
            return (this._SafeStr_7012 as _SafeStr_1444);
        }


    }
}//package _-Go

// _SafeStr_1444 = "_-Gd" (String#7638, DoABC#3)
// _SafeStr_216 = "_-Jh" (String#7850, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


