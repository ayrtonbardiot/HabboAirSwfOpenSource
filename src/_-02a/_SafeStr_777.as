// by nota

//_-02a._SafeStr_777

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_777 implements IMessageComposer 
    {

        private var _SafeStr_4318:int;
        private var _SafeStr_4609:int;
        private var _saturation:int;
        private var _SafeStr_4610:int;

        public function _SafeStr_777(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            _SafeStr_4318 = _arg_1;
            _SafeStr_4609 = _arg_2;
            _saturation = _arg_3;
            _SafeStr_4610 = _arg_4;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4318, _SafeStr_4609, _saturation, _SafeStr_4610]);
        }

        public function dispose():void
        {
        }


    }
}//package _-02a

// _SafeStr_4318 = "_-9J" (String#7188, DoABC#3)
// _SafeStr_4609 = "_-K1q" (String#7898, DoABC#3)
// _SafeStr_4610 = "_-M1Z" (String#8005, DoABC#3)
// _SafeStr_777 = "_-d1H" (String#9178, DoABC#3)


