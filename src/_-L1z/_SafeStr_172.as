// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-L1z._SafeStr_172

package _-L1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_172 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_172(_arg_1:int)
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
}//package _-L1z

// _SafeStr_172 = "_-v1u" (String#10401, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


