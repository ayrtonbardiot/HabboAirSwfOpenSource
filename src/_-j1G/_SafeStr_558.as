// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_558

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_558 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_4428:int = 0;

        public function _SafeStr_558(_arg_1:int, _arg_2:int=0)
        {
            _SafeStr_4157 = _arg_1;
            _SafeStr_4428 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157, _SafeStr_4428]);
        }


    }
}//package _-j1G

// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_4428 = "_-ZC" (String#8932, DoABC#3)
// _SafeStr_558 = "_-z11" (String#10653, DoABC#3)


