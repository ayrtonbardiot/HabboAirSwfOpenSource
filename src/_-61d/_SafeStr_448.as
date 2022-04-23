// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61d._SafeStr_448

package _-61d
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_448 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_448(_arg_1:int)
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
}//package _-61d

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_448 = "_-81L" (String#7076, DoABC#3)


