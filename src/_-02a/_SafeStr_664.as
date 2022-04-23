// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02a._SafeStr_664

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_664 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_4428:int = 0;

        public function _SafeStr_664(_arg_1:int, _arg_2:int=0)
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
}//package _-02a

// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_4428 = "_-ZC" (String#8932, DoABC#3)
// _SafeStr_664 = "_-s1r" (String#10203, DoABC#3)


