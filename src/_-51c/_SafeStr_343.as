// by nota

//_-51c._SafeStr_343

package _-51c
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_343 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_343(_arg_1:Boolean)
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
// _SafeStr_343 = "_-v11" (String#10375, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


