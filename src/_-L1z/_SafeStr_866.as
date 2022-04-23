// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-L1z._SafeStr_866

package _-L1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_866 implements IMessageComposer 
    {

        private var _SafeStr_4375:int;

        public function _SafeStr_866(_arg_1:int)
        {
            _SafeStr_4375 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4375]);
        }

        public function dispose():void
        {
        }


    }
}//package _-L1z

// _SafeStr_4375 = "_-Q2" (String#8307, DoABC#3)
// _SafeStr_866 = "_-KB" (String#7906, DoABC#3)


