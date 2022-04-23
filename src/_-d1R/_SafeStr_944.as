// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1R._SafeStr_944

package _-d1R
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_944 implements IMessageComposer 
    {

        private var _SafeStr_4028:int;

        public function _SafeStr_944(_arg_1:int)
        {
            _SafeStr_4028 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var _local_1:Array = [];
            _local_1.push(_SafeStr_4028);
            return (_local_1);
        }


    }
}//package _-d1R

// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_944 = "_-6y" (String#7005, DoABC#3)


