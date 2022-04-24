// by nota

//_-o1x._SafeStr_960

package _-o1x
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_960 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_960(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_6600 = [_arg_1, _arg_2, _arg_3];
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_6600 == null);
        }


    }
}//package _-o1x

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_960 = "_-P1K" (String#8233, DoABC#3)


