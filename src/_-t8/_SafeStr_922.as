// by nota

//_-t8._SafeStr_922

package _-t8
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_922 implements IMessageComposer 
    {

        private var _SafeStr_4863:int = 0;

        public function _SafeStr_922(_arg_1:int)
        {
            _SafeStr_4863 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var _local_1:Array = [];
            _local_1.push(_SafeStr_4863);
            return (_local_1);
        }


    }
}//package _-t8

// _SafeStr_4863 = "_-A1K" (String#7219, DoABC#3)
// _SafeStr_922 = "_-fQ" (String#9365, DoABC#3)


