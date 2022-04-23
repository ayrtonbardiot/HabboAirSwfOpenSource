// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_258

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1283;

    [SecureSWF(rename="true")]
    public class _SafeStr_258 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_258(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1283);
        }

        public function getParser():_SafeStr_1283
        {
            return (this._SafeStr_7012 as _SafeStr_1283);
        }

        public function get root():_SafeStr_1289
        {
            return (getParser().root);
        }

        public function get newAdditionsAvailable():Boolean
        {
            return (getParser().newAdditionsAvailable);
        }

        public function get catalogType():String
        {
            return (getParser().catalogType);
        }


    }
}//package _-AE

// _SafeStr_1283 = "_-VU" (String#8641, DoABC#3)
// _SafeStr_1289 = "_-H1D" (String#7664, DoABC#3)
// _SafeStr_258 = "_-dE" (String#9233, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


