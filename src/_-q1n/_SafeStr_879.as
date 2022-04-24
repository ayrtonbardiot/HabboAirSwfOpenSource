// by nota

//_-q1n._SafeStr_879

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_879 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_879(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-q1n

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_879 = "_-c" (String#9099, DoABC#3)


