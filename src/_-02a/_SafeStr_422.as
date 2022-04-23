// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02a._SafeStr_422

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_422 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array;

        public function _SafeStr_422(_arg_1:int, _arg_2:int)
        {
            _SafeStr_6600 = [_arg_1, _arg_2];
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }


    }
}//package _-02a

// _SafeStr_422 = "_-HR" (String#7697, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


