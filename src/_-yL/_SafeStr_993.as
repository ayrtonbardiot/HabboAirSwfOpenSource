// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-yL._SafeStr_993

package _-yL
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-K1r._SafeStr_1253;

    [SecureSWF(rename="true")]
    public class _SafeStr_993 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_993(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1253);
        }

        public function get encryptedPublicKey():String
        {
            return ((this._SafeStr_7012 as _SafeStr_1253).encryptedPublicKey);
        }

        public function get serverClientEncryption():Boolean
        {
            return ((this._SafeStr_7012 as _SafeStr_1253).serverClientEncryption);
        }


    }
}//package _-yL

// _SafeStr_1253 = "_-bW" (String#9085, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_993 = "_-p1i" (String#9992, DoABC#3)


