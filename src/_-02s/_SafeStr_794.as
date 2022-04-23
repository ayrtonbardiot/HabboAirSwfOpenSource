// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02s._SafeStr_794

package _-02s
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TT._SafeStr_1322;

    [SecureSWF(rename="true")]
    public class _SafeStr_794 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_794(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1322);
        }

        public function getParser():_SafeStr_1322
        {
            return (_SafeStr_7012 as _SafeStr_1322);
        }


    }
}//package _-02s

// _SafeStr_1322 = "_-z1D" (String#10655, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_794 = "_-h1p" (String#9480, DoABC#3)


