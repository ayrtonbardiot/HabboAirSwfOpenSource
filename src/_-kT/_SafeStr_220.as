// by nota

//_-kT._SafeStr_220

package _-kT
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_220 implements IMessageComposer 
    {

        private var _SafeStr_7366:Array = [];

        public function _SafeStr_220(_arg_1:int)
        {
            _SafeStr_7366.push(_arg_1);
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

// _SafeStr_220 = "_-C1j" (String#7369, DoABC#3)
// _SafeStr_7366 = "_-y1M" (String#10586, DoABC#3)


