// by nota

//_-M1k._SafeStr_119

package _-M1k
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_119 implements IMessageComposer, _SafeStr_13 
    {

        private var flatId:String;

        public function _SafeStr_119(_arg_1:String)
        {
            this.flatId = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([flatId]);
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-M1k

// _SafeStr_119 = "_-H4" (String#7687, DoABC#3)
// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)


