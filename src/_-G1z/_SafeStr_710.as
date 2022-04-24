// by nota

//_-G1z._SafeStr_710

package _-G1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_710 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = null;

        public function _SafeStr_710(_arg_1:int)
        {
            _SafeStr_3740 = [_arg_1];
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
}//package _-G1z

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_710 = "_-S1H" (String#8403, DoABC#3)


