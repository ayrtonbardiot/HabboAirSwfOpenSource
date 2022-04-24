// by nota

//_-g18._SafeStr_371

package _-g18
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;

    [SecureSWF(rename="true")]
    public class _SafeStr_371 implements IMessageComposer, IPreEncryptionMessage 
    {

        private var _publicKey:String;

        public function _SafeStr_371(_arg_1:String)
        {
            _publicKey = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_publicKey]);
        }


    }
}//package _-g18

// _SafeStr_371 = "_-CO" (String#7392, DoABC#3)


