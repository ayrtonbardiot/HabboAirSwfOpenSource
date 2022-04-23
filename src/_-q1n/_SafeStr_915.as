// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-q1n._SafeStr_915

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_915 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array;

        public function _SafeStr_915(_arg_1:int, _arg_2:int, _arg_3:String)
        {
            _SafeStr_3740 = [_arg_1, _arg_2, _arg_3];
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-q1n

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_915 = "_-y7" (String#10613, DoABC#3)


