// by nota

//_-j1G._SafeStr_136

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_136 implements IMessageComposer 
    {

        protected var _SafeStr_3740:Array = [];

        public function _SafeStr_136(_arg_1:int)
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
}//package _-j1G

// _SafeStr_136 = "_-8G" (String#7121, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


