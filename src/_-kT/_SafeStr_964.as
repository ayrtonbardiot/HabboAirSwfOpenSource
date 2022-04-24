// by nota

//_-kT._SafeStr_964

package _-kT
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_964 implements IMessageComposer 
    {

        private var _SafeStr_7366:Array = [];

        public function _SafeStr_964(_arg_1:String, _arg_2:int)
        {
            _SafeStr_7366 = [_arg_1, _arg_2];
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_7366);
        }

        public function dispose():void
        {
            _SafeStr_7366 = null;
        }


    }
}//package _-kT

// _SafeStr_7366 = "_-y1M" (String#10586, DoABC#3)
// _SafeStr_964 = "_-w1g" (String#10460, DoABC#3)


