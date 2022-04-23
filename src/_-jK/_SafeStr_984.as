// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-jK._SafeStr_984

package _-jK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-cP._SafeStr_1080;

    [SecureSWF(rename="true")]
    public class _SafeStr_984 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_984(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1080);
        }

        public function getParser():_SafeStr_1080
        {
            return (this._SafeStr_7012 as _SafeStr_1080);
        }


    }
}//package _-jK

// _SafeStr_1080 = "_-v13" (String#10377, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_984 = "_-sb" (String#10226, DoABC#3)


