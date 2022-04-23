// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-kT._SafeStr_649

package _-kT
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_649 implements IMessageComposer 
    {

        private var _SafeStr_7366:Array = [];

        public function _SafeStr_649(_arg_1:String)
        {
            _SafeStr_7366.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_7366);
        }

        public function dispose():void
        {
            _SafeStr_7366 = null;
        }


    }
}//package _-kT

// _SafeStr_649 = "_-W1T" (String#8713, DoABC#3)
// _SafeStr_7366 = "_-y1M" (String#10586, DoABC#3)


