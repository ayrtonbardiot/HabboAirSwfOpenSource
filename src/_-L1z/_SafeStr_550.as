// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-L1z._SafeStr_550

package _-L1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_550 implements IMessageComposer 
    {

        private var _SafeStr_7386:int;

        public function _SafeStr_550(_arg_1:int)
        {
            _SafeStr_7386 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7386]);
        }

        public function dispose():void
        {
        }


    }
}//package _-L1z

// _SafeStr_550 = "_-l11" (String#9722, DoABC#3)
// _SafeStr_7386 = "_-t1n" (String#10261, DoABC#3)


