// by nota

//_-02a._SafeStr_1002

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_1002 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;

        public function _SafeStr_1002(_arg_1:int)
        {
            _SafeStr_4157 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157]);
        }


    }
}//package _-02a

// _SafeStr_1002 = "_-TK" (String#8513, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)


