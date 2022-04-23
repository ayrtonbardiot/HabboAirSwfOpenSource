// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1z._SafeStr_139

package _-Z1z
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Zz._SafeStr_1190;

    [SecureSWF(rename="true")]
    public class _SafeStr_139 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_139(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1190);
        }

        public function getParser():_SafeStr_1190
        {
            return (_SafeStr_7012 as _SafeStr_1190);
        }


    }
}//package _-Z1z

// _SafeStr_1190 = "_-M1u" (String#8017, DoABC#3)
// _SafeStr_139 = "_-CG" (String#7386, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


