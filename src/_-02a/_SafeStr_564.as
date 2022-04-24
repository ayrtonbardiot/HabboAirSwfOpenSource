// by nota

//_-02a._SafeStr_564

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_564 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array;

        public function _SafeStr_564(_arg_1:int)
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


    }
}//package _-02a

// _SafeStr_564 = "_-Eq" (String#7522, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


