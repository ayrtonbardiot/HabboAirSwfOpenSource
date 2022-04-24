// by nota

//_-q1n._SafeStr_264

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_264 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_264(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            _SafeStr_3740 = [_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6];
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

// _SafeStr_264 = "_-H9" (String#7690, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


