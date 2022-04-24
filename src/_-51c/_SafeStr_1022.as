// by nota

//_-51c._SafeStr_1022

package _-51c
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_1022 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_3740:Array = [];
        private var _disposed:Boolean = false;


        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }


    }
}//package _-51c

// _SafeStr_1022 = "_-tl" (String#10297, DoABC#3)
// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


