// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-XO._SafeStr_746

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_746 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];


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
// _SafeStr_746 = "_-91B" (String#7157, DoABC#3)


