// by nota

//_-u15._SafeStr_423

package _-u15
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_423 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_423(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int)
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
}//package _-u15

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_423 = "_-12N" (String#6569, DoABC#3)


