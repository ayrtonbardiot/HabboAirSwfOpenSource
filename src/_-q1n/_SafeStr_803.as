// by nota

//_-q1n._SafeStr_803

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_803 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_803(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String)
        {
            _SafeStr_3740 = [_arg_1, _arg_2, _arg_3, _arg_4];
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
// _SafeStr_803 = "_-W19" (String#8665, DoABC#3)


