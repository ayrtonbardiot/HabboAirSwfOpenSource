// by nota

//_-02a._SafeStr_819

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_819 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array;

        public function _SafeStr_819(_arg_1:int, _arg_2:int=-100)
        {
            _SafeStr_3740 = [_arg_1, _arg_2];
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
}//package _-02a

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_819 = "_-iR" (String#9559, DoABC#3)


