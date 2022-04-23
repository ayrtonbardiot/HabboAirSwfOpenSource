// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02a._SafeStr_906

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_906 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_4332:int;

        public function _SafeStr_906(_arg_1:int, _arg_2:int)
        {
            _SafeStr_4157 = _arg_1;
            _SafeStr_4332 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157, _SafeStr_4332]);
        }


    }
}//package _-02a

// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_4332 = "_-lq" (String#9784, DoABC#3)
// _SafeStr_906 = "_-51u" (String#6899, DoABC#3)


