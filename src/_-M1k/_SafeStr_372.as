// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-M1k._SafeStr_372

package _-M1k
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_372 implements IMessageComposer 
    {

        private var _SafeStr_4028:String;

        public function _SafeStr_372(_arg_1:String):void
        {
            _SafeStr_4028 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4028]);
        }

        public function dispose():void
        {
            _SafeStr_4028 = null;
        }


    }
}//package _-M1k

// _SafeStr_372 = "_-N1R" (String#8065, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)


