// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1r._SafeStr_1253

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1253 implements IMessageParser 
    {

        private var _SafeStr_7350:String;
        private var _SafeStr_7351:Boolean = false;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7350 = _arg_1.readString();
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_7351 = _arg_1.readBoolean();
            };
            return (true);
        }

        public function get encryptedPublicKey():String
        {
            return (_SafeStr_7350);
        }

        public function get serverClientEncryption():Boolean
        {
            return (_SafeStr_7351);
        }


    }
}//package _-K1r

// _SafeStr_1253 = "_-bW" (String#9085, DoABC#3)
// _SafeStr_7350 = "_-Ae" (String#7290, DoABC#3)
// _SafeStr_7351 = "_-Za" (String#8944, DoABC#3)


