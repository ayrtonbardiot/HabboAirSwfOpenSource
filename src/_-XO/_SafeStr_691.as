// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-XO._SafeStr_691

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_691 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_691(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }


    }
}//package _-XO

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_691 = "_-b1s" (String#9072, DoABC#3)


