// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Po._SafeStr_1003

package _-Po
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_1003 implements IMessageComposer 
    {

        private var _SafeStr_5407:int;
        private var _SafeStr_7500:int;

        public function _SafeStr_1003(_arg_1:int, _arg_2:int)
        {
            _SafeStr_5407 = _arg_1;
            _SafeStr_7500 = _arg_2;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_5407, _SafeStr_7500]);
        }

        public function dispose():void
        {
        }


    }
}//package _-Po

// _SafeStr_1003 = "_-j1o" (String#9608, DoABC#3)
// _SafeStr_5407 = "_-c3" (String#9132, DoABC#3)
// _SafeStr_7500 = "_-C8" (String#7381, DoABC#3)


