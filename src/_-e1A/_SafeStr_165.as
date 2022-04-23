// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-e1A._SafeStr_165

package _-e1A
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_165 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];


        public function dispose():void
        {
            _SafeStr_3740 = null;
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-e1A

// _SafeStr_165 = "_-m1Y" (String#9805, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


