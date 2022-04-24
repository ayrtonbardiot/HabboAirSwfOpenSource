// by nota

//_-kT._SafeStr_963

package _-kT
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_963 implements IMessageComposer 
    {

        private var _SafeStr_7366:Array = [];

        public function _SafeStr_963(_arg_1:String)
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

// _SafeStr_7366 = "_-y1M" (String#10586, DoABC#3)
// _SafeStr_963 = "_-vA" (String#10410, DoABC#3)


