// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-m1i._SafeStr_300

package _-m1i
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_300 implements IMessageComposer 
    {

        private var _SafeStr_5431:int;

        public function _SafeStr_300(_arg_1:int)
        {
            _SafeStr_5431 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_5431]);
        }

        public function dispose():void
        {
        }


    }
}//package _-m1i

// _SafeStr_300 = "_-ix" (String#9578, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)


