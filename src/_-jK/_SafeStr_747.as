// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-jK._SafeStr_747

package _-jK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-cP._SafeStr_1397;

    [SecureSWF(rename="true")]
    public class _SafeStr_747 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_747(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1397);
        }

        public function getParser():_SafeStr_1397
        {
            return (this._SafeStr_7012 as _SafeStr_1397);
        }


    }
}//package _-jK

// _SafeStr_1397 = "_-H1O" (String#7667, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_747 = "_-Ct" (String#7406, DoABC#3)


