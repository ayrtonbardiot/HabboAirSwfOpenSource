// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-qv._SafeStr_473

package _-qv
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_473 implements IMessageComposer 
    {

        private var _SafeStr_7518:int;
        private var _SafeStr_7519:int;
        private var _SafeStr_7520:int;

        public function _SafeStr_473(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_7518 = _arg_1;
            _SafeStr_7519 = _arg_2;
            _SafeStr_7520 = _arg_3;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7518, _SafeStr_7519, _SafeStr_7520]);
        }

        public function dispose():void
        {
        }


    }
}//package _-qv

// _SafeStr_473 = "_-F1E" (String#7533, DoABC#3)
// _SafeStr_7518 = "_-w1Y" (String#10456, DoABC#3)
// _SafeStr_7519 = "_-CA" (String#7382, DoABC#3)
// _SafeStr_7520 = "_-PA" (String#8256, DoABC#3)


