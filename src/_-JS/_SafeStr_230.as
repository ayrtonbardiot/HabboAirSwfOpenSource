// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-JS._SafeStr_230

package _-JS
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-wm._SafeStr_1232;

    [SecureSWF(rename="true")]
    public class _SafeStr_230 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_230(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1232);
        }

        public function getParser():_SafeStr_1232
        {
            return (this._SafeStr_7012 as _SafeStr_1232);
        }


    }
}//package _-JS

// _SafeStr_1232 = "_-G1x" (String#7613, DoABC#3)
// _SafeStr_230 = "_-SR" (String#8445, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


