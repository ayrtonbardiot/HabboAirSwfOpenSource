// by nota

//_-51c._SafeStr_979

package _-51c
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_979 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_979(_arg_1:String)
        {
            _SafeStr_6600.push(_arg_1);
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
}//package _-51c

// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_979 = "_-F1H" (String#7536, DoABC#3)


