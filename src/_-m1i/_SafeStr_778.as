// by nota

//_-m1i._SafeStr_778

package _-m1i
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_778 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_778(_arg_1:int, _arg_2:int)
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
}//package _-m1i

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_778 = "_-bc" (String#9088, DoABC#3)


