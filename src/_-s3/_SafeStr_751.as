// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-s3._SafeStr_751

package _-s3
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_751 implements IMessageComposer 
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
}//package _-s3

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_751 = "_-G1d" (String#7602, DoABC#3)


