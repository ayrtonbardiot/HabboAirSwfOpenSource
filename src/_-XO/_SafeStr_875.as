// by nota

//_-XO._SafeStr_875

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_875 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_875(_arg_1:int, _arg_2:String, _arg_3:String)
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
}//package _-XO

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_875 = "_-WP" (String#8740, DoABC#3)


