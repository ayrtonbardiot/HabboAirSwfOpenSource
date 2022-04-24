// by nota

//_-02a._SafeStr_153

package _-02a-02a-02a-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_153 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array;

        public function _SafeStr_153(_arg_1:int, _arg_2:String)
        {
            _SafeStr_6600 = [_arg_1, _arg_2];
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
}//package _-02a

// _SafeStr_153 = "_-j1P" (String#9600, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


