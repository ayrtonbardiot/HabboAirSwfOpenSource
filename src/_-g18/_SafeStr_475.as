// by nota

//_-g18._SafeStr_475

package _-g18
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;

    [SecureSWF(rename="true")]
    public class _SafeStr_475 implements IMessageComposer, IPreEncryptionMessage 
    {

        private var _SafeStr_7232:String = "FLASH3";


        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var _local_1:String = "WIN63-202203291339-356770471";
            return (new Array(_local_1, _SafeStr_7232, 1, 0));
        }


    }
}//package _-g18

// _SafeStr_475 = "_-c1t" (String#9127, DoABC#3)
// _SafeStr_7232 = "_-K1x" (String#7901, DoABC#3)


