// by nota

//_-hV._SafeStr_156

package _-hV
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_156 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_156(_arg_1:String)
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

// _SafeStr_156 = "_-AO" (String#7281, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


