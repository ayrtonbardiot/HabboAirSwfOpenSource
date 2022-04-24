// by nota

//_-q1n._SafeStr_669

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_669 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_669(_arg_1:int, _arg_2:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }


    }
}//package _-q1n

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_669 = "_-BK" (String#7333, DoABC#3)


