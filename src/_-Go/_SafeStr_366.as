// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Go._SafeStr_366

package _-Go
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-61Z._SafeStr_1396;

    [SecureSWF(rename="true")]
    public class _SafeStr_366 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_366(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1396);
        }

        public function getParser():_SafeStr_1396
        {
            return (this._SafeStr_7012 as _SafeStr_1396);
        }


    }
}//package _-Go

// _SafeStr_1396 = "_-S1i" (String#8416, DoABC#3)
// _SafeStr_366 = "_-g1u" (String#9408, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


