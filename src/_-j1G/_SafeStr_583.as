// by nota

//_-j1G._SafeStr_583

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_583 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;
        private var _direction:int;

        public function _SafeStr_583(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            _SafeStr_4157 = _arg_1;
            _SafeStr_4050 = _arg_2;
            _SafeStr_4051 = _arg_3;
            _direction = _arg_4;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157, _SafeStr_4050, _SafeStr_4051, _direction]);
        }


    }
}//package _-j1G

// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_583 = "_-fA" (String#9357, DoABC#3)


