// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_617

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1384;

    [SecureSWF(rename="true")]
    public class _SafeStr_617 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_617(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1384);
        }

        public function getParser():_SafeStr_1384
        {
            return (_SafeStr_7012 as _SafeStr_1384);
        }


    }
}//package _-d1i

// _SafeStr_1384 = "_-R1n" (String#8354, DoABC#3)
// _SafeStr_617 = "_-Ab" (String#7287, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


