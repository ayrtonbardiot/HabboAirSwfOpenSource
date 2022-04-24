// by nota

//_-61d._SafeStr_705

package _-61d
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_705 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_705(_arg_1:String)
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
// _SafeStr_705 = "_-eG" (String#9300, DoABC#3)


