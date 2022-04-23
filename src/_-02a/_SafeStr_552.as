// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02a._SafeStr_552

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_552 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array;

        public function _SafeStr_552(_arg_1:int, _arg_2:Boolean)
        {
            _SafeStr_3740 = [_arg_1, _arg_2];
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }


    }
}//package _-02a

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_552 = "_-fM" (String#9362, DoABC#3)


