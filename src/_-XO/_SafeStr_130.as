// by nota

//_-XO._SafeStr_130

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_130 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_130(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
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

// _SafeStr_130 = "_-N1T" (String#8067, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


