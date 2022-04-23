// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-L1z._SafeStr_700

package _-L1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_700 implements IMessageComposer 
    {

        private var _SafeStr_4128:int;

        public function _SafeStr_700(_arg_1:int)
        {
            _SafeStr_4128 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4128]);
        }


    }
}//package _-L1z

// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_700 = "_-NQ" (String#8098, DoABC#3)


