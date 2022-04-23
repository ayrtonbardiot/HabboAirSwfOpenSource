// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_972

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1438;

    [SecureSWF(rename="true")]
    public class _SafeStr_972 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_972(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1438);
        }

        public function getParser():_SafeStr_1438
        {
            return (_SafeStr_7012 as _SafeStr_1438);
        }


    }
}//package _-Ja

// _SafeStr_1438 = "_-1v" (String#6622, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_972 = "_-aI" (String#9014, DoABC#3)


