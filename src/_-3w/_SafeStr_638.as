// by nota

//_-3W._SafeStr_638

package _-3W
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_638 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_638(_arg_1:String, _arg_2:String)
        {
            _SafeStr_3740.push(_arg_2);
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
}//package _-3W

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_638 = "_-p1r" (String#9998, DoABC#3)


