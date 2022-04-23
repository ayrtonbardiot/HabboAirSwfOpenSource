// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-qw._SafeStr_883

package _-qw
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-kC._SafeStr_1500;

    [SecureSWF(rename="true")]
    public class _SafeStr_883 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_883(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1500);
        }

        public function getParser():_SafeStr_1500
        {
            return (_SafeStr_7012 as _SafeStr_1500);
        }


    }
}//package _-qw

// _SafeStr_1500 = "_-Di" (String#7455, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_883 = "_-F5" (String#7561, DoABC#3)


