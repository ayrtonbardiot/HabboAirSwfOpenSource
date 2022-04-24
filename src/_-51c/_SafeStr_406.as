// by nota

//_-51c._SafeStr_406

package _-51c
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_406 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_406(_arg_1:int)
        {
            _SafeStr_6600 = [_arg_1];
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
}//package _-51c

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_406 = "_-79" (String#7036, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


