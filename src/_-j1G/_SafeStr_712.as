// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_712

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_712 implements IMessageComposer 
    {

        private var _SafeStr_5431:int;
        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;

        public function _SafeStr_712(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_5431 = _arg_1;
            _SafeStr_4050 = _arg_2;
            _SafeStr_4051 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_5431, _SafeStr_4050, _SafeStr_4051]);
        }


    }
}//package _-j1G

// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_712 = "_-lr" (String#9785, DoABC#3)


