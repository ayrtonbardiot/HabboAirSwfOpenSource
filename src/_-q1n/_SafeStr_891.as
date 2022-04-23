// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-q1n._SafeStr_891

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_891 implements IMessageComposer 
    {

        private var _SafeStr_7505:int;

        public function _SafeStr_891(_arg_1:int)
        {
            _SafeStr_7505 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7505]);
        }

        public function dispose():void
        {
        }


    }
}//package _-q1n

// _SafeStr_7505 = "_-M1r" (String#8016, DoABC#3)
// _SafeStr_891 = "_-W1b" (String#8715, DoABC#3)


