// by nota

//_-61d._SafeStr_410

package _-61d
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_410 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_410(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
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
}//package _-61d

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_410 = "_-51e" (String#6890, DoABC#3)


