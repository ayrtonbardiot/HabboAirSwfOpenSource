// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-41O._SafeStr_871

package _-41O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-3D._SafeStr_1068;

    [SecureSWF(rename="true")]
    public class _SafeStr_871 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_871(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1068);
        }

        public function getParser():_SafeStr_1068
        {
            return (this._SafeStr_7012 as _SafeStr_1068);
        }


    }
}//package _-41O

// _SafeStr_1068 = "_-o1m" (String#9935, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_871 = "_-Gt" (String#7650, DoABC#3)


