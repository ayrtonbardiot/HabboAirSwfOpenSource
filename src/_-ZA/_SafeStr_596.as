// by nota

//_-ZA._SafeStr_596

package _-ZA
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.util.Byte;

    [SecureSWF(rename="true")]
    public class _SafeStr_596 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_596(_arg_1:int)
        {
            _SafeStr_6600.push(new Byte(_arg_1));
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-ZA

// _SafeStr_596 = "_-32c" (String#6751, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


