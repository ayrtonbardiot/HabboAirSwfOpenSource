// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-EK._SafeStr_161

package _-EK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-28._SafeStr_1360;

    [SecureSWF(rename="true")]
    public class _SafeStr_161 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_161(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1360);
        }

        public function getParser():_SafeStr_1360
        {
            return (_SafeStr_7012 as _SafeStr_1360);
        }


    }
}//package _-EK

// _SafeStr_1360 = "_-H1A" (String#7661, DoABC#3)
// _SafeStr_161 = "_-h1R" (String#9468, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


