// by nota

//_-j1G._SafeStr_430

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_430 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_430(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
            _SafeStr_3740.push(_arg_4);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }


    }
}//package _-j1G

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_430 = "_-I3" (String#7737, DoABC#3)


