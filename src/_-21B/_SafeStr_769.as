// by nota

//_-21B._SafeStr_769

package _-21B
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_769 implements IMessageComposer 
    {

        private var _text:String;
        private var _SafeStr_5982:int = 0;

        public function _SafeStr_769(_arg_1:String, _arg_2:int=0)
        {
            _text = _arg_1;
            _SafeStr_5982 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_text, _SafeStr_5982]);
        }


    }
}//package _-21B

// _SafeStr_5982 = "_-AQ" (String#7283, DoABC#3)
// _SafeStr_769 = "_-d1v" (String#9227, DoABC#3)


