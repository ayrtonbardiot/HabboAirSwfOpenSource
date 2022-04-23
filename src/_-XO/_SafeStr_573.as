// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-XO._SafeStr_573

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_573 implements IMessageComposer 
    {

        private var _SafeStr_7786:String;

        public function _SafeStr_573(_arg_1:String)
        {
            _SafeStr_7786 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7786]);
        }


    }
}//package _-XO

// _SafeStr_573 = "_-E1J" (String#7468, DoABC#3)
// _SafeStr_7786 = "_-cD" (String#9135, DoABC#3)


