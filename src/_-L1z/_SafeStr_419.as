// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-L1z._SafeStr_419

package _-L1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_419 implements IMessageComposer 
    {

        private var _SafeStr_5431:int;

        public function _SafeStr_419(_arg_1:int)
        {
            _SafeStr_5431 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_5431]);
        }


    }
}//package _-L1z

// _SafeStr_419 = "_-Em" (String#7519, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)


