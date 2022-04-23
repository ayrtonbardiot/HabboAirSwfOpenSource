// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_608

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1482;

    [SecureSWF(rename="true")]
    public class _SafeStr_608 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_608(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1482);
        }

        public function getParser():_SafeStr_1482
        {
            return (_SafeStr_7012 as _SafeStr_1482);
        }


    }
}//package _-d1i

// _SafeStr_1482 = "_-s1d" (String#10195, DoABC#3)
// _SafeStr_608 = "_-AA" (String#7243, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


