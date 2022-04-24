// by nota

//_-hV._SafeStr_947

package _-hV
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_947 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_947(_arg_1:String)
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
}//package _-hV

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_947 = "_-iy" (String#9579, DoABC#3)


