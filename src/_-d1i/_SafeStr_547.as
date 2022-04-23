// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_547

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1319;

    [SecureSWF(rename="true")]
    public class _SafeStr_547 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_547(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1319);
        }

        public function getParser():_SafeStr_1319
        {
            return (_SafeStr_7012 as _SafeStr_1319);
        }


    }
}//package _-d1i

// _SafeStr_1319 = "_-u1s" (String#10327, DoABC#3)
// _SafeStr_547 = "_-D1J" (String#7421, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


