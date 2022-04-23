// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-q1n._SafeStr_829

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_829 implements IMessageComposer 
    {

        private var _offerId:int;

        public function _SafeStr_829(_arg_1:int)
        {
            _offerId = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_offerId]);
        }

        public function dispose():void
        {
        }


    }
}//package _-q1n

// _SafeStr_829 = "_-w1" (String#10436, DoABC#3)


