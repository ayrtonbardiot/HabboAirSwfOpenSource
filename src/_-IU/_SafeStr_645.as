// by nota

//_-IU._SafeStr_645

package _-IU
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_645 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_645(_arg_1:int, _arg_2:int=0)
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
            _SafeStr_3740 = [];
        }


    }
}//package _-IU

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_645 = "_-D16" (String#7415, DoABC#3)


