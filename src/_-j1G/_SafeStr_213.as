// by nota

//_-j1G._SafeStr_213

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_213 implements IMessageComposer 
    {

        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;

        public function _SafeStr_213(_arg_1:int, _arg_2:int)
        {
            _SafeStr_4050 = _arg_1;
            _SafeStr_4051 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4050, _SafeStr_4051]);
        }


    }
}//package _-j1G

// _SafeStr_213 = "_-n1Z" (String#9879, DoABC#3)
// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)


