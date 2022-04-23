// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Nk._SafeStr_1023

package _-Nk
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-l1Q._SafeStr_1349;

    [SecureSWF(rename="true")]
    public class _SafeStr_1023 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_1023(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1349);
        }

        public function get secondsRemaining():int
        {
            return (_SafeStr_1349(_SafeStr_7012).secondsRemaining);
        }


    }
}//package _-Nk

// _SafeStr_1023 = "_-i12" (String#9517, DoABC#3)
// _SafeStr_1349 = "_-up" (String#10364, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


