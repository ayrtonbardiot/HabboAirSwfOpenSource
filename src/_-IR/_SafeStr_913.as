// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-IR._SafeStr_913

package _-IR
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_913 implements IMessageComposer 
    {

        private var _SafeStr_4132:Array;

        public function _SafeStr_913(_arg_1:int, _arg_2:String="", _arg_3:int=-1)
        {
            _SafeStr_4132 = [_arg_1, _arg_2, _arg_3];
        }

        public function dispose():void
        {
            _SafeStr_4132 = null;
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_4132);
        }


    }
}//package _-IR

// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)
// _SafeStr_913 = "_-02x" (String#6526, DoABC#3)


