// by nota

//_-q1n._SafeStr_486

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_486 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_486(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
        }

        public function dispose():void
        {
            _SafeStr_3740 = [];
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-q1n

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_486 = "_-X1y" (String#8787, DoABC#3)


