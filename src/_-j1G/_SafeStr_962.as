// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_962

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_962 implements IMessageComposer 
    {

        private var _SafeStr_5431:int;

        public function _SafeStr_962(_arg_1:int)
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
}//package _-j1G

// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_962 = "_-w10" (String#10437, DoABC#3)


