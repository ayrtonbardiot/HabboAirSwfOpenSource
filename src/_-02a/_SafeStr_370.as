// by nota

//_-02a._SafeStr_370

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_370 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_7006:String;

        public function _SafeStr_370(_arg_1:int, _arg_2:String)
        {
            _SafeStr_4157 = _arg_1;
            _SafeStr_7006 = _arg_2;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157, _SafeStr_7006]);
        }

        public function dispose():void
        {
        }


    }
}//package _-02a

// _SafeStr_370 = "_-O14" (String#8131, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_7006 = "_-6E" (String#6983, DoABC#3)


