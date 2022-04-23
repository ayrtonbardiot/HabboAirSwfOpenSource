// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-8c._SafeStr_882

package _-8c
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_882 implements IMessageComposer 
    {

        private var _SafeStr_7130:String;

        public function _SafeStr_882(_arg_1:String)
        {
            _SafeStr_7130 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7130]);
        }

        public function dispose():void
        {
            _SafeStr_7130 = null;
        }


    }
}//package _-8c

// _SafeStr_7130 = "_-WK" (String#8738, DoABC#3)
// _SafeStr_882 = "_-32t" (String#6758, DoABC#3)


