// by nota

//_-j1G._SafeStr_1031

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_1031 implements IMessageComposer 
    {

        private var _SafeStr_5666:int;
        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;

        public function _SafeStr_1031(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_5666 = _arg_1;
            _SafeStr_4050 = _arg_2;
            _SafeStr_4051 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_5666, _SafeStr_4050, _SafeStr_4051]);
        }


    }
}//package _-j1G

// _SafeStr_1031 = "_-v1y" (String#10404, DoABC#3)
// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_5666 = "_-32J" (String#6745, DoABC#3)


