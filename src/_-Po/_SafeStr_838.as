// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Po._SafeStr_838

package _-Po
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_838 implements IMessageComposer 
    {

        private var _username:String;

        public function _SafeStr_838(_arg_1:String)
        {
            _username = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_username]);
        }

        public function dispose():void
        {
            _username = null;
        }


    }
}//package _-Po

// _SafeStr_838 = "_-41a" (String#6826, DoABC#3)


