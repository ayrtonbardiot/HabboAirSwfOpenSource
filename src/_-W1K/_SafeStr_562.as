// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_562

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1154;

    [SecureSWF(rename="true")]
    public class _SafeStr_562 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_562(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1154);
        }

        public function get guilds():Array
        {
            return (_SafeStr_1154(_SafeStr_7012).guilds);
        }


    }
}//package _-W1K

// _SafeStr_1154 = "_-A1t" (String#7234, DoABC#3)
// _SafeStr_562 = "_-fO" (String#9363, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


