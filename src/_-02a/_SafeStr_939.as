// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02a._SafeStr_939

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_939 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array;

        public function _SafeStr_939(_arg_1:Boolean, _arg_2:int, _arg_3:Boolean)
        {
            _SafeStr_3740 = [_arg_1, _arg_2, _arg_3];
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
// _SafeStr_939 = "_-Iu" (String#7761, DoABC#3)


