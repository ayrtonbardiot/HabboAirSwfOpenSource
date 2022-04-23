// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-i1z._SafeStr_995

package _-i1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_995 implements IMessageComposer 
    {

        private var _SafeStr_7147:String;

        public function _SafeStr_995(_arg_1:String)
        {
            _SafeStr_7147 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var _local_1:Array = [];
            _local_1.push(_SafeStr_7147);
            return (_local_1);
        }


    }
}//package _-i1z

// _SafeStr_7147 = "_-KY" (String#7919, DoABC#3)
// _SafeStr_995 = "_-zE" (String#10687, DoABC#3)


