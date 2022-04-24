// by nota

//_-m1i._SafeStr_677

package _-m1i
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_677 implements IMessageComposer 
    {

        public static const _SafeStr_7390:int = 0;
        public static const _SafeStr_7391:int = 1;
        public static const _SafeStr_7392:int = 2;

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_677(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
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
}//package _-m1i

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_677 = "_-Q4" (String#8309, DoABC#3)
// _SafeStr_7390 = "_-017" (String#6469, DoABC#3)
// _SafeStr_7391 = "_-Yr" (String#8880, DoABC#3)
// _SafeStr_7392 = "_-cR" (String#9143, DoABC#3)


