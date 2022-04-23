// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-EK._SafeStr_261

package _-EK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-28._SafeStr_1344;

    [SecureSWF(rename="true")]
    public class _SafeStr_261 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_261(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1344);
        }

        public function get messageText():String
        {
            return ((_SafeStr_7012 as _SafeStr_1344).messageText);
        }

        public function getParser():_SafeStr_1344
        {
            return (_SafeStr_7012 as _SafeStr_1344);
        }


    }
}//package _-EK

// _SafeStr_1344 = "_-P1" (String#8223, DoABC#3)
// _SafeStr_261 = "_-q1S" (String#10050, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


