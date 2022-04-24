// by nota

//_-IU._SafeStr_162

package _-IU
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_162 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_162(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = [];
        }


    }
}//package _-IU

// _SafeStr_162 = "_-u1p" (String#10324, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


