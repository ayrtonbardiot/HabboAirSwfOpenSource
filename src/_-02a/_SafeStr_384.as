// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02a._SafeStr_384

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_384 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;

        public function _SafeStr_384(_arg_1:int)
        {
            _SafeStr_4157 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157]);
        }


    }
}//package _-02a

// _SafeStr_384 = "_-l1K" (String#9742, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)


