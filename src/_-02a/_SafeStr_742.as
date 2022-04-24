// by nota

//_-02a._SafeStr_742

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_742 implements IMessageComposer 
    {

        private var _presetNumber:int;
        private var _SafeStr_6510:int;
        private var _SafeStr_7009:String;
        private var _SafeStr_7010:int;
        private var _SafeStr_7011:Boolean;

        public function _SafeStr_742(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean)
        {
            _presetNumber = _arg_1;
            _SafeStr_6510 = _arg_2;
            _SafeStr_7009 = _arg_3;
            _SafeStr_7010 = _arg_4;
            _SafeStr_7011 = _arg_5;
        }

        public function getMessageArray():Array
        {
            return ([_presetNumber, _SafeStr_6510, _SafeStr_7009, _SafeStr_7010, _SafeStr_7011]);
        }

        public function dispose():void
        {
        }


    }
}//package _-02a

// _SafeStr_6510 = "_-i15" (String#9519, DoABC#3)
// _SafeStr_7009 = "_-R0" (String#8335, DoABC#3)
// _SafeStr_7010 = "_-7L" (String#7043, DoABC#3)
// _SafeStr_7011 = "_-s1p" (String#10201, DoABC#3)
// _SafeStr_742 = "_-3v" (String#6791, DoABC#3)


