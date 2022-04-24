// by nota

//_-21B._SafeStr_798

package _-21B
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_798 implements IMessageComposer 
    {

        private var _text:String;
        private var _recipientName:String;
        private var _SafeStr_5982:int = 0;

        public function _SafeStr_798(_arg_1:String, _arg_2:String, _arg_3:int=0)
        {
            _recipientName = _arg_1;
            _text = _arg_2;
            _SafeStr_5982 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([((_recipientName + " ") + _text), _SafeStr_5982]);
        }


    }
}//package _-21B

// _SafeStr_5982 = "_-AQ" (String#7283, DoABC#3)
// _SafeStr_798 = "_-7g" (String#7054, DoABC#3)


