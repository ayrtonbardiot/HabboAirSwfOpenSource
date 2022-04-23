// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-yL._SafeStr_133

package _-yL
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-K1r._SafeStr_1096;

    [SecureSWF(rename="true")]
    public class _SafeStr_133 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_133(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1096);
        }

        public function get encryptedPrime():String
        {
            return ((this._SafeStr_7012 as _SafeStr_1096).encryptedPrime);
        }

        public function get encryptedGenerator():String
        {
            return ((this._SafeStr_7012 as _SafeStr_1096).encryptedGenerator);
        }


    }
}//package _-yL

// _SafeStr_1096 = "_-B1b" (String#7311, DoABC#3)
// _SafeStr_133 = "_-nK" (String#9901, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


