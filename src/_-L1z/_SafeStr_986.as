// by nota

//_-L1z._SafeStr_986

package _-L1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_986 implements IMessageComposer 
    {

        private var _SafeStr_6095:int = 0;

        public function _SafeStr_986(_arg_1:int)
        {
            _SafeStr_6095 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_6095 = 0;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_6095]);
        }


    }
}//package _-L1z

// _SafeStr_6095 = "_-e12" (String#9263, DoABC#3)
// _SafeStr_986 = "_-la" (String#9777, DoABC#3)


