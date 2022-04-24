// by nota

//_-qv._SafeStr_203

package _-qv
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_203 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array;

        public function _SafeStr_203(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:Boolean, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int, _arg_11:int)
        {
            _SafeStr_6600 = [_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11];
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }


    }
}//package _-qv

// _SafeStr_203 = "_-W17" (String#8663, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


