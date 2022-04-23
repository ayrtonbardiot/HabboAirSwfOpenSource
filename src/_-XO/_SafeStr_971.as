// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-XO._SafeStr_971

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_971 implements IMessageComposer 
    {

        private var _SafeStr_4332:int;

        public function _SafeStr_971(_arg_1:int)
        {
            _SafeStr_4332 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4332]);
        }

        public function dispose():void
        {
        }


    }
}//package _-XO

// _SafeStr_4332 = "_-lq" (String#9784, DoABC#3)
// _SafeStr_971 = "_-tD" (String#10277, DoABC#3)


