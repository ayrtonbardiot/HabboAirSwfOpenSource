// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-51c._SafeStr_548

package _-51c
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_548 implements IMessageComposer 
    {

        private var _searchString:String;

        public function _SafeStr_548(_arg_1:String)
        {
            _searchString = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_searchString]);
        }

        public function dispose():void
        {
        }


    }
}//package _-51c

// _SafeStr_548 = "_-816" (String#7069, DoABC#3)


