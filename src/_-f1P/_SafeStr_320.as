// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-f1P._SafeStr_320

package _-f1P
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_320 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_320(_arg_1:String)
        {
            _SafeStr_3740.push(_arg_1);
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
}//package _-f1P

// _SafeStr_320 = "_-o1p" (String#9938, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


