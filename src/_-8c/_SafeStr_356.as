// by nota

//_-8c._SafeStr_356

package _-8c
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_356 implements IMessageComposer 
    {

        private var _SafeStr_7130:String;

        public function _SafeStr_356(_arg_1:String)
        {
            _SafeStr_7130 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7130]);
        }

        public function dispose():void
        {
            _SafeStr_7130 = null;
        }


    }
}//package _-8c

// _SafeStr_356 = "_-Wd" (String#8748, DoABC#3)
// _SafeStr_7130 = "_-WK" (String#8738, DoABC#3)


