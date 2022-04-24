// by nota

//_-g18._SafeStr_509

package _-g18
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_509 implements IMessageComposer 
    {

        private var _SafeStr_7233:String;
        private var _SafeStr_7234:String;
        private var _flashVersion:String;

        public function _SafeStr_509(_arg_1:String, _arg_2:String, _arg_3:String)
        {
            _SafeStr_7233 = _arg_1;
            _SafeStr_7234 = _arg_2;
            _flashVersion = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7233, _SafeStr_7234, _flashVersion]);
        }


    }
}//package _-g18

// _SafeStr_509 = "_-A1Z" (String#7226, DoABC#3)
// _SafeStr_7233 = "_-m1h" (String#9812, DoABC#3)
// _SafeStr_7234 = "_-Bu" (String#7349, DoABC#3)


