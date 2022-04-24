// by nota

//_-q1n._SafeStr_805

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_805 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_805(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
            _SafeStr_3740.push(_arg_4);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-q1n

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_805 = "_-Z13" (String#8885, DoABC#3)


