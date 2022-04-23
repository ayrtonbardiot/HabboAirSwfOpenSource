// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-T1V._SafeStr_396

package _-T1V
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_396 implements IMessageComposer 
    {

        private var _SafeStr_5666:int;
        private var _SafeStr_7561:int;

        public function _SafeStr_396(_arg_1:int, _arg_2:int)
        {
            _SafeStr_5666 = _arg_1;
            _SafeStr_7561 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_5666, _SafeStr_7561]);
        }


    }
}//package _-T1V

// _SafeStr_396 = "_-5i" (String#6925, DoABC#3)
// _SafeStr_5666 = "_-32J" (String#6745, DoABC#3)
// _SafeStr_7561 = "_-7A" (String#7037, DoABC#3)


