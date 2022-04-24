// by nota

//_-g18._SafeStr_464

package _-g18
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_464 implements IMessageComposer 
    {

        private var _SafeStr_7229:int;
        private var _SafeStr_7230:String;
        private var _SafeStr_7231:String;

        public function _SafeStr_464(_arg_1:int, _arg_2:String, _arg_3:String)
        {
            _SafeStr_7229 = _arg_1;
            _SafeStr_7230 = _arg_2;
            _SafeStr_7231 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7229, _SafeStr_7230, _SafeStr_7231]);
        }


    }
}//package _-g18

// _SafeStr_464 = "_-1C" (String#6595, DoABC#3)
// _SafeStr_7229 = "_-m17" (String#9792, DoABC#3)
// _SafeStr_7230 = "_-W7" (String#8729, DoABC#3)
// _SafeStr_7231 = "_-kP" (String#9703, DoABC#3)


