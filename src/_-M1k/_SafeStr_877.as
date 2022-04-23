// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-M1k._SafeStr_877

package _-M1k
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_877 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_877(_arg_1:int)
        {
            _SafeStr_6600.push(_arg_1);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }


    }
}//package _-M1k

// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_877 = "_-k1n" (String#9687, DoABC#3)


