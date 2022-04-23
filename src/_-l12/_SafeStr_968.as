// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l12._SafeStr_968

package _-l12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-u1V._SafeStr_1227;

    [SecureSWF(rename="true")]
    public class _SafeStr_968 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_968(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1227);
        }

        public function getParser():_SafeStr_1227
        {
            return (this._SafeStr_7012 as _SafeStr_1227);
        }


    }
}//package _-l12

// _SafeStr_1227 = "_-Vi" (String#8647, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_968 = "_-a1y" (String#8993, DoABC#3)


