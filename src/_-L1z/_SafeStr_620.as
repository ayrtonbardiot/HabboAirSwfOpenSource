// by nota

//_-L1z._SafeStr_620

package _-L1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_620 implements IMessageComposer 
    {

        private var _SafeStr_4133:int;
        private var _SafeStr_7387:int;

        public function _SafeStr_620(_arg_1:int, _arg_2:int)
        {
            _SafeStr_4133 = _arg_1;
            _SafeStr_7387 = _arg_2;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4133, _SafeStr_7387]);
        }

        public function dispose():void
        {
        }


    }
}//package _-L1z

// _SafeStr_4133 = "_-127" (String#6564, DoABC#3)
// _SafeStr_620 = "_-L1y" (String#7958, DoABC#3)
// _SafeStr_7387 = "_-p11" (String#9971, DoABC#3)


