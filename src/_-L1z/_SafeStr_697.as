// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-L1z._SafeStr_697

package _-L1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_697 implements IMessageComposer 
    {

        private var _SafeStr_4880:String;

        public function _SafeStr_697(_arg_1:String)
        {
            _SafeStr_4880 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4880]);
        }


    }
}//package _-L1z

// _SafeStr_4880 = "_-v1" (String#10374, DoABC#3)
// _SafeStr_697 = "_-t1A" (String#10244, DoABC#3)


