// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-T1V._SafeStr_849

package _-T1V
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_849 implements IMessageComposer 
    {

        private var _SafeStr_5666:int;
        private var _SafeStr_7561:int;
        private var _SafeStr_7562:String;

        public function _SafeStr_849(_arg_1:int, _arg_2:int, _arg_3:String)
        {
            _SafeStr_5666 = _arg_1;
            _SafeStr_7561 = _arg_2;
            _SafeStr_7562 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_5666, _SafeStr_7561, _SafeStr_7562]);
        }


    }
}//package _-T1V

// _SafeStr_5666 = "_-32J" (String#6745, DoABC#3)
// _SafeStr_7561 = "_-7A" (String#7037, DoABC#3)
// _SafeStr_7562 = "_-J3" (String#7791, DoABC#3)
// _SafeStr_849 = "_-E1I" (String#7467, DoABC#3)


