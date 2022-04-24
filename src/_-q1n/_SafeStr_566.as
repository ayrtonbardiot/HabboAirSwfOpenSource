// by nota

//_-q1n._SafeStr_566

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_566 implements IMessageComposer 
    {

        private var _SafeStr_4838:String;

        public function _SafeStr_566(_arg_1:String)
        {
            _SafeStr_4838 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4838]);
        }

        public function dispose():void
        {
            _SafeStr_4838 = null;
        }


    }
}//package _-q1n

// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)
// _SafeStr_566 = "_-VF" (String#8635, DoABC#3)


