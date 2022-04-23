// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-p1Y._SafeStr_935

package _-p1Y
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_935 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_935(_arg_1:int, _arg_2:int)
        {
            _SafeStr_6600.push(_arg_1);
            _SafeStr_6600.push(_arg_2);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }


    }
}//package _-p1Y

// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_935 = "_-e1z" (String#9293, DoABC#3)


