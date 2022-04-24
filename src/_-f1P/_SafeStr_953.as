// by nota

//_-f1P._SafeStr_953

package _-f1P
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_953 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_953(_arg_1:String)
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

        public function get disposed():Boolean
        {
            return (_SafeStr_3740 == null);
        }


    }
}//package _-f1P

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_953 = "_-a1w" (String#8991, DoABC#3)


